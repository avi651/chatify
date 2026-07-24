//
//  MessageRepositoryImpl.swift
//  Chatify
//
//  Created by AVINASH on 24/07/26.
//

import Foundation

final class MessageRepositoryImpl: MessageRepository {
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func getMessages(conversationId: String) async throws -> [Message] {
        let response: MessageListResponseDTO = try await apiClient.request(MessageEndpoint.getMessages(conversationId))
        
        return response.messages.map { $0.toDomain() }
    }
}
