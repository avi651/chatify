//
//  GetMessagesUseCase.swift
//  Chatify
//
//  Created by AVINASH on 24/07/26.
//


import Foundation

protocol GetMessagesUseCase {

    func execute(
        conversationId: String
    ) async throws -> [Message]
}

final class GetMessagesUseCaseImpl: GetMessagesUseCase {

    private let repository: MessageRepository

    init(repository: MessageRepository) {
        self.repository = repository
    }

    func execute(
        conversationId: String
    ) async throws -> [Message] {

        try await repository.getMessages(
            conversationId: conversationId
        )
    }
}
