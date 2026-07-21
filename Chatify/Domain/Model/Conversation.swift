//
//  ChatModel.swift
//  Chatify
//
//  Created by AVINASH on 21/07/26.
//

import Foundation

public struct Conversation: Identifiable, Equatable, Sendable {

    public let id: String
    public let participantId: String
    public let participantName: String
    public let participantAvatar: URL?

    public let lastMessage: String
    public let lastMessageTime: Date

    public let unreadCount: Int

    public let isOnline: Bool
    public let isTyping: Bool

    public init(
        id: String,
        participantId: String,
        participantName: String,
        participantAvatar: URL?,
        lastMessage: String,
        lastMessageTime: Date,
        unreadCount: Int,
        isOnline: Bool,
        isTyping: Bool
    ) {
        self.id = id
        self.participantId = participantId
        self.participantName = participantName
        self.participantAvatar = participantAvatar
        self.lastMessage = lastMessage
        self.lastMessageTime = lastMessageTime
        self.unreadCount = unreadCount
        self.isOnline = isOnline
        self.isTyping = isTyping
    }
}
