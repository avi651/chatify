//
//  ConversationDTO.swift
//  Chatify
//
//  Created by AVINASH on 22/07/26.
//

import Foundation

struct ConversationDTO: Decodable {

    let id: Int
    let isGroup: Bool
    let name: String
    let createdAt: Date

    enum CodingKeys: String, CodingKey {
        case id
        case isGroup = "is_group"
        case name
        case createdAt = "created_at"
    }
}

extension ConversationDTO {

    func toDomain() -> Conversation {

        Conversation(
            id: String(id),
            participantId: "",
            participantName: name,
            participantAvatar: nil,
            lastMessage: "",
            lastMessageTime: createdAt,
            unreadCount: 0,
            isOnline: false,
            isTyping: false
        )
    }
}
