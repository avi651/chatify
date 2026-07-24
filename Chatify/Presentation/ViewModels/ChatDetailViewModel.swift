//
//  ChatDetailViewModel.swift
//  Chatify
//

import Foundation
import Combine


final class ChatDetailViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published var messages: [Message] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    // MARK: - Private Properties

    private let conversation: Conversation
    private let getMessagesUseCase: GetMessagesUseCase
    private let webSocketService: WebSocketService

    private var cancellables = Set<AnyCancellable>()
    
    private let keychainService: KeychainService

    // MARK: - Computed Properties

    var navigationTitle: String {
        conversation.participantName
    }

    // MARK: - Initializer

    init(
        conversation: Conversation,
        getMessagesUseCase: GetMessagesUseCase,
        webSocketService: WebSocketService,
        keychainService: KeychainService
    ) {
        self.conversation = conversation
        self.getMessagesUseCase = getMessagesUseCase
        self.webSocketService = webSocketService
        self.keychainService = keychainService
    }

    // MARK: - Lifecycle

    func onAppear() async {

        await loadMessages()

        connectWebSocket()
    }

    func onDisappear() {

        disconnectWebSocket()
    }

    // MARK: - Messages

    func loadMessages() async {

        isLoading = true
        errorMessage = nil

        defer {
            isLoading = false
        }

        do {

            messages = try await getMessagesUseCase.execute(
                conversationId: conversation.id
            )

        } catch {

            errorMessage = error.localizedDescription
            print("❌ Failed to load messages: \(error)")
        }
    }

    // MARK: - WebSocket

    private func connectWebSocket() {

        observeSocket()

        do {

            guard let token = try keychainService.read(
                for: .accessToken
            ) else {

                print("❌ Access token not found")
                return
            }

            webSocketService.connect(
                token: token
            )

        } catch {

            print("❌ Failed to read access token: \(error)")
        }
    }

    private func disconnectWebSocket() {

        webSocketService.disconnect()

        cancellables.removeAll()
    }

    private func observeSocket() {

        cancellables.removeAll()

        webSocketService.events
            .receive(on: DispatchQueue.main)
            .sink { [weak self] event in

                guard let self else { return }

                switch event {

                case .connected:

                    print("🟢 WebSocket Connected")

                case .disconnected:

                    print("🔴 WebSocket Disconnected")

                case .message(let socketMessage):

                    guard socketMessage.conversationId == conversation.id else {
                        return
                    }

                    let message = Message(
                        id: UUID().uuidString,
                        senderId: socketMessage.senderId,
                        text: socketMessage.text,
                        messageType: .text,
                        fileURL: nil,
                        fileName: nil,
                        fileSize: nil,
                        createdAt: socketMessage.sentAt
                    )

                    messages.append(message)

                case .error(let error):

                    print("❌ WebSocket Error: \(error.localizedDescription)")
                }

            }
            .store(in: &cancellables)
    }

    // MARK: - Send Message

    func sendMessage(_ text: String) {

        guard !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return
        }

        let socketMessage = WebSocketMessage(
            conversationId: conversation.id,
            senderId: "1", // TODO: Replace with logged-in user id
            text: text,
            sentAt: Date()
        )

        webSocketService.send(socketMessage)
    }
}
