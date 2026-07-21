//
//  WebSocketServiceImpl.swift
//  Chatify
//
//  Created by AVINASH on 21/07/26.
//

import Foundation
import Combine

final class WebSocketServiceImpl: WebSocketService {
    
    private let session: URLSession
    
    private var socket: URLSessionWebSocketTask?
    
    private let messageSubject = PassthroughSubject<String, Never>()
    
    var messages: AnyPublisher<String, Never> {
        messageSubject.eraseToAnyPublisher()
    }
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    private func receive() {
        
        socket?.receive { [weak self] result in
            
            guard let self else { return }
            
            switch result {
                
            case .success(let message):
                
                switch message {
                    
                case .string(let text):
                    print("⬇️ Received: \(text)")
                    self.messageSubject.send(text)
                    
                case .data(let data):
                    print("⬇️ Received Data: \(data)")
                    
                @unknown default:
                    break
                }
                
                // Continue listening
                self.receive()
                
            case .failure(let error):
                print("❌ WebSocket Error: \(error.localizedDescription)")
            }
        }
    }
    
    func connect(token: String) {
        
        guard var components = URLComponents(
            url: AppConfiguration.websocketURL,
            resolvingAgainstBaseURL: false
        ) else {
            return
        }
        
        components.queryItems = [
            URLQueryItem(name: "token", value: token)
        ]
        
        guard let url = components.url else {
            return
        }
        
        print("🔗 Connecting to \(url.absoluteString)")
        
        socket = session.webSocketTask(with: url)
        socket?.resume()
        
        receive()
    }
    
    func send(_ text: String) {
        
        let message = URLSessionWebSocketTask.Message.string(text)
        
        socket?.send(message) { error in
            
            if let error {
                print("❌ Send Error: \(error.localizedDescription)")
                return
            }
            
            print("⬆️ Sent: \(text)")
        }
    }
    
    func disconnect() {
        
        socket?.cancel(
            with: .goingAway,
            reason: nil
        )
        
        socket = nil
        
        print("🔌 WebSocket Disconnected")
    }
}
