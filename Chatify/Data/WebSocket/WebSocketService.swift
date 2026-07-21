//
//  WebSocketService.swift
//  Chatify
//
//  Created by AVINASH on 21/07/26.
//

import Combine

protocol WebSocketService {

    var messages: AnyPublisher<String, Never> { get }

    func connect(token: String)

    func send(_ text: String)

    func disconnect()
}
