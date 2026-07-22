//
//  ConversationRepositoryImpl.swift
//  Chatify
//
//  Created by AVINASH on 22/07/26.
//

import Foundation

final class ConversationRepositoryImpl: ConversationRepository {

    // MARK: - Properties

    private let apiClient: APIClient

    // MARK: - Initializer

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    // MARK: - Get Conversations

    func getConversations() async throws -> [Conversation] {

        let response: [ConversationDTO] = try await apiClient.request(
            ConversationEndpoint.getConversations
        )

        return response.map {
            $0.toDomain()
        }
    }
}
