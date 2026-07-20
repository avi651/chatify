//
//  WebSocketError.swift
//  Chatify
//
//  Created by AVINASH on 20/07/26.
//


import Foundation

enum WebSocketError: LocalizedError {

    case invalidURL

    case notConnected

    case connectionFailed

    case disconnected

    var errorDescription: String? {

        switch self {

        case .invalidURL:
            return "Invalid WebSocket URL."

        case .notConnected:
            return "WebSocket is not connected."

        case .connectionFailed:
            return "Unable to establish WebSocket connection."

        case .disconnected:
            return "WebSocket disconnected."
        }
    }
}
