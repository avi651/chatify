//
//  WebSocketService.swift
//  Chatify
//
//  Created by AVINASH on 20/07/26.
//


import Foundation
import Combine

protocol WebSocketService {
    var connectionStatePublisher: AnyPublisher<WebSocketState, Never> { get }
    func connect(roomId: Int)
    func disconnect()
}
