//
//  SocketMessageDTO.swift
//  Chatify
//
//  Created by AVINASH on 24/07/26.
//

import Foundation

struct SocketMessageDTO: Codable {

    let id: Int
    let conversationId: Int
    let senderId: Int
    let message: String
    let messageType: String
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case conversationId = "conversation_id"
        case senderId = "sender_id"
        case message
        case messageType = "message_type"
        case createdAt = "created_at"
    }
}
