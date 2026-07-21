//
//  ObserveConversationsUseCase.swift
//  Chatify
//
//  Created by AVINASH on 21/07/26.
//

import Combine

public protocol ObserveConversationsUseCase {
    func execute() -> AnyPublisher<[Conversation], Never>
}
