//
//  WebSocketMessage.swift
//  Chatify
//
//  Created by AVINASH on 21/07/26.
//

import Foundation

public struct WebSocketMessage: Codable, Sendable {
    
    public let conversationId: String
    public let senderId: String
    public let text: String
    public let sentAt: Date
    
    public init(
        conversationId: String,
        senderId: String,
        text: String,
        sentAt: Date
    ) {
        self.conversationId = conversationId
        self.senderId = senderId
        self.text = text
        self.sentAt = sentAt
    }
}
