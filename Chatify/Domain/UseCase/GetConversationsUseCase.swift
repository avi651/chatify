//
//  GetConversationsUseCase.swift
//  Chatify
//
//  Created by AVINASH on 22/07/26.
//

import Foundation

protocol GetConversationsUseCase {

    func execute() async throws -> [Conversation]
}

final class GetConversationsUseCaseImpl: GetConversationsUseCase {

    private let repository: ConversationRepository

    init(repository: ConversationRepository) {
        self.repository = repository
    }

    func execute() async throws -> [Conversation] {
        try await repository.getConversations()
    }
}
