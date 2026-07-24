//
//  MessageRepository.swift
//  Chatify
//
//  Created by AVINASH on 24/07/26.
//

import Foundation

protocol MessageRepository {

    func getMessages(
        conversationId: String
    ) async throws -> [Message]
}
