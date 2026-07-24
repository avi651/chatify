//
//  WebSocketServiceImpl.swift
//  Chatify
//
//  Created by AVINASH on 21/07/26.
//


import Foundation
import Combine

final class WebSocketServiceImpl: WebSocketService {

    // MARK: - Properties

    private let session: URLSession
    private var socket: URLSessionWebSocketTask?

    private let eventSubject = PassthroughSubject<WebSocketEvent, Never>()

    var events: AnyPublisher<WebSocketEvent, Never> {
        eventSubject.eraseToAnyPublisher()
    }

    // MARK: - Initializer

    init(session: URLSession = .shared) {
        self.session = session
    }

    // MARK: - Public

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

        print("🔗 Connecting: \(url.absoluteString)")

        socket = session.webSocketTask(with: url)
        socket?.resume()

        eventSubject.send(.connected)

        receive()
    }

    func send(_ message: WebSocketMessage) {

        guard let socket else { return }

        do {

            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601

            let data = try encoder.encode(message)

            let json = String(decoding: data, as: UTF8.self)

            socket.send(.string(json)) { [weak self] error in

                if let error {

                    self?.eventSubject.send(.error(error))
                    return
                }

                print("⬆️ Sent: \(json)")
            }

        } catch {

            eventSubject.send(.error(error))
        }
    }

    func disconnect() {

        socket?.cancel(with: .goingAway, reason: nil)

        socket = nil

        eventSubject.send(.disconnected)

        print("🔌 WebSocket Disconnected")
    }

    // MARK: - Private

    private func receive() {

        socket?.receive { [weak self] result in

            guard let self else { return }

            switch result {

            case .success(let message):

                switch message {

                case .string(let text):

                    print("⬇️ \(text)")

                    decode(text)

                case .data(let data):

                    if let text = String(data: data, encoding: .utf8) {
                        decode(text)
                    }

                @unknown default:
                    break
                }

                receive()

            case .failure(let error):

                eventSubject.send(.error(error))
            }
        }
    }

    private func decode(_ text: String) {

        do {

            let envelope = try JSONDecoder().decode(
                WebSocketEnvelope.self,
                from: Data(text.utf8)
            )

            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSSSSXXXXX"
            formatter.locale = Locale(identifier: "en_US_POSIX")

            let sentAt = formatter.date(from: envelope.data.createdAt) ?? Date()

            let message = WebSocketMessage(
                conversationId: String(envelope.data.conversationId),
                senderId: String(envelope.data.senderId),
                text: envelope.data.message,
                sentAt: sentAt
            )

            eventSubject.send(.message(message))

        } catch {

            print("❌ Decode Error: \(error)")
            eventSubject.send(.error(error))
        }
    }
}
