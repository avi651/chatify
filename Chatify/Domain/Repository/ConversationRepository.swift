//
//  ConversationRepository.swift
//  Chatify
//
//  Created by AVINASH on 22/07/26.
//

import Foundation

protocol ConversationRepository {
    func getConversations() async throws -> [Conversation]
}
