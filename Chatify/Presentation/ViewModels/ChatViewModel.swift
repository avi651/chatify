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
    
    @Published var messages: [String] = []
    @Published var isConnected = false
    
    // MARK: - Private Properties
    
    private let webSocketService: WebSocketService
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initializer
    
    init(webSocketService: WebSocketService) {
        self.webSocketService = webSocketService
        observeMessages()
    }
    
    // MARK: - Public Methods
    
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

private extension ChatViewModel {
    
    func observeMessages() {
        webSocketService.messages
            .receive(on: DispatchQueue.main)
            .sink { [weak self] message in
                self?.messages.append(message)
            }
            .store(in: &cancellables)
    }
    
}
