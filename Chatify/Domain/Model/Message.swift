//
//  Message.swift
//  Chatify
//
//  Created by AVINASH on 24/07/26.
//

import Foundation

public struct Message: Identifiable, Equatable, Sendable {

    public let id: String
    public let senderId: String

    public let text: String?

    public let messageType: MessageType

    public let fileURL: URL?
    public let fileName: String?
    public let fileSize: Int?

    public let createdAt: Date

    public var isMine: Bool {
        senderId == "1"      // Abhi temporary
    }
}

public enum MessageType: String, Codable, Sendable {
    case text
    case image
    case video
    case file
}
