//
//  ObserveConversationsUseCaseImpl.swift
//  Chatify
//
//  Created by AVINASH on 21/07/26.
//

import Combine

public final class ObserveConversationsUseCaseImpl: ObserveConversationsUseCase {

    private let repository: ChatRepository

    public init(repository: ChatRepository) {
        self.repository = repository
    }

    public func execute() -> AnyPublisher<[Conversation], Never> {
        repository.conversations
    }
}
