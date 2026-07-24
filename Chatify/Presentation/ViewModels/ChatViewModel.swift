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

        observeSocket()
    }

    // MARK: - Conversations

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
    }

    func disconnect() {
        webSocketService.disconnect()
    }

    func send(_ message: WebSocketMessage) {
        webSocketService.send(message)
    }
}

// MARK: - Private

private extension ChatViewModel {

    func observeSocket() {

        webSocketService.events
            .receive(on: DispatchQueue.main)
            .sink { [weak self] event in

                guard let self else { return }

                switch event {

                case .connected:
                    self.isConnected = true
                    print("🟢 WebSocket Connected")

                case .disconnected:
                    self.isConnected = false
                    print("🔴 WebSocket Disconnected")

                case .message(let message):
                    print("📩 \(message)")

                    // TODO:
                    // Update conversation preview
                    // Update unread count
                    // Move latest conversation to top

                case .error(let error):
                    self.errorMessage = error.localizedDescription
                    print("❌ WebSocket Error: \(error)")
                }
            }
            .store(in: &cancellables)
    }
}
