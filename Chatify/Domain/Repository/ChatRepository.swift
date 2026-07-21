//
//  ChatRepository.swift
//  Chatify
//
//  Created by AVINASH on 21/07/26.
//

import Combine

public protocol ChatRepository {
    
    var conversations: AnyPublisher<[Conversation], Never> { get }
    func loadConversations() async throws
    
    func connect()
    func disconnect()
    
    func search(text: String) -> AnyPublisher<[Conversation], Never>
}
