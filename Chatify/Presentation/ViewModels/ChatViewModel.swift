//
//  ChatViewModel.swift
//  Chatify
//
//  Created by AVINASH on 20/07/26.
//

import Foundation
import Combine


final class ChatViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published var conversations: [Conversation] = []
    @Published var isConnected = false
    @Published var isLoading = false
    @Published var errorMessage: String?

    // MARK: - Private Properties

    private let getConversationsUseCase: GetConversationsUseCase
    private let webSocketService: WebSocketService

    private var cancellables = Set<AnyCancellable>()

    // MARK: - Init

    init(
        getConversationsUseCase: GetConversationsUseCase,
        webSocketService: WebSocketService
    ) {
        self.getConversationsUseCase = getConversationsUseCase
        self.webSocketService = webSocketService

        observeMessages()
    }

    // MARK: - Conversation

    func loadConversations() async {

        isLoading = true
        errorMessage = nil

        defer {
            isLoading = false
        }

        do {
            conversations = try await getConversationsUseCase.execute()
        } catch {
            errorMessage = error.localizedDescription
            print("❌ Failed to load conversations: \(error)")
        }
    }

    // MARK: - WebSocket

    func connect(token: String) {
        webSocketService.connect(token: token)
        isConnected = true
    }

    func disconnect() {
        webSocketService.disconnect()
        isConnected = false
    }

    func send(message: String) {
        webSocketService.send(message)
    }
}

// MARK: - Private

private extension ChatViewModel {

    func observeMessages() {

        webSocketService.messages
            .receive(on: DispatchQueue.main)
            .sink { [weak self] message in

                print("📩 \(message)")

                // Future:
                // Decode WebSocket JSON
                // Update conversation list
                // Update unread count
                // Move latest conversation to top

                _ = self
            }
            .store(in: &cancellables)
    }
}
