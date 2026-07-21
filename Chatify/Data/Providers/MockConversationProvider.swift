//
//  MockConversationProvider.swift
//  Chatify
//
//  Created by AVINASH on 21/07/26.
//

import Foundation

enum MockConversationProvider {
    
    static func conversations() -> [Conversation] {
        
        [
            Conversation(
                id: "1",
                participantId: "101",
                participantName: "Rahul",
                participantAvatar: nil,
                lastMessage: "Hello bro",
                lastMessageTime: .now,
                unreadCount: 2,
                isOnline: true,
                isTyping: false
            ),
            
            Conversation(
                id: "2",
                participantId: "102",
                participantName: "Neha",
                participantAvatar: nil,
                lastMessage: "Typing...",
                lastMessageTime: .now.addingTimeInterval(-120),
                unreadCount: 0,
                isOnline: true,
                isTyping: true
            ),
            
            Conversation(
                id: "3",
                participantId: "103",
                participantName: "Amit",
                participantAvatar: nil,
                lastMessage: "Photo",
                lastMessageTime: .now.addingTimeInterval(-3600),
                unreadCount: 5,
                isOnline: false,
                isTyping: false
            )
        ]
    }
}
