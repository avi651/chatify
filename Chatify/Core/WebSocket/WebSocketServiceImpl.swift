//
//  WebSocketServiceImpl.swift
//  Chatify
//
//  Created by AVINASH on 20/07/26.
//


import Foundation
import Combine

final class WebSocketServiceImpl: WebSocketService {

    private let session: URLSession

    private var task: URLSessionWebSocketTask?

    private let connectionStateSubject =
        CurrentValueSubject<WebSocketState, Never>(.disconnected)

    var connectionStatePublisher: AnyPublisher<WebSocketState, Never> {

        connectionStateSubject
            .eraseToAnyPublisher()
    }

    init(session: URLSession = .shared) {

        self.session = session
    }

    func connect(roomId: Int) {

        connectionStateSubject.send(.connecting)

        let url = AppConfiguration.websocketURL
            .appendingPathComponent("\(roomId)")

        task = session.webSocketTask(with: url)

        task?.resume()

        connectionStateSubject.send(.connected)
    }

    func disconnect() {

        task?.cancel(with: .normalClosure, reason: nil)

        task = nil

        connectionStateSubject.send(.disconnected)
    }
}
