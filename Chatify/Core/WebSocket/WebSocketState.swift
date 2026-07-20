//
//  WebSocketState.swift
//  Chatify
//
//  Created by AVINASH on 20/07/26.
//

import Foundation

enum WebSocketState: Equatable {

    case disconnected
    case connecting
    case connected
    case failed(Error)

    static func == (lhs: WebSocketState, rhs: WebSocketState) -> Bool {

        switch (lhs, rhs) {

        case (.disconnected, .disconnected):
            return true

        case (.connecting, .connecting):
            return true

        case (.connected, .connected):
            return true

        case (.failed, .failed):
            return true

        default:
            return false
        }
    }
}
