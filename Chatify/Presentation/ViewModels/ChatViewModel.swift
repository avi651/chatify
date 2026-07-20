//
//  ChatViewModel.swift
//  Chatify
//
//  Created by AVINASH on 20/07/26.
//

import Foundation
import Combine
import Observation

@Observable
final class ChatViewModel {
    private let webSocketService: WebSocketService
    private var cancellables = Set<AnyCancellable>()
    var connectionState: WebSocketState = .disconnected
    
    init(webSocketService: WebSocketService) {
        self.webSocketService = webSocketService
    }
    
    func connect(roomId: Int) {
        webSocketService.connect(roomId: roomId)
    }
    
    func disconnect() {
        webSocketService.disconnect()
    }
    
    private func observeConnectionState() {
        
        webSocketService.connectionStatePublisher
        .receive(on: DispatchQueue.main)
        .sink { [weak self] state in
             self?.connectionState = state
         }.store(in: &cancellables)
        
    }
}
