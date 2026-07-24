//
//  MessageDTO.swift
//  Chatify
//
//  Created by AVINASH on 24/07/26.
//

import Foundation

struct MessageDTO: Decodable {

    let id: Int
    let senderId: Int

    let message: String?

    let messageType: String

    let fileURL: String?
    let fileName: String?
    let fileSize: Int?

    let createdAt: Date

    enum CodingKeys: String, CodingKey {

        case id

        case senderId = "sender_id"

        case message

        case messageType = "message_type"

        case fileURL = "file_url"

        case fileName = "file_name"

        case fileSize = "file_size"

        case createdAt = "created_at"
    }
}

extension MessageDTO {

    func toDomain() -> Message {

        Message(
            id: String(id),
            senderId: String(senderId),
            text: message,
            messageType: MessageType(rawValue: messageType) ?? .text,
            fileURL: fileURL.flatMap(URL.init(string:)),
            fileName: fileName,
            fileSize: fileSize,
            createdAt: createdAt
        )
    }
}
