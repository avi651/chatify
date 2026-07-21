//
//  WebSocketEvent.swift
//  Chatify
//
//  Created by AVINASH on 21/07/26.
//

import Foundation

public enum WebSocketEvent: Sendable {
    
    case connected
    
    case disconnected
    
    case message(WebSocketMessage)
    
    case error(Error)
}
