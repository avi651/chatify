//
//  WebSocketService.swift
//  Chatify
//
//  Created by AVINASH on 21/07/26.
//

import Combine

protocol WebSocketService {

    var events: AnyPublisher<WebSocketEvent, Never> { get }

    func connect(token: String)

    func send(_ message: WebSocketMessage)

    func disconnect()
}
