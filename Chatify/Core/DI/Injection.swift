//
//  Injection.swift
//  Chatify
//
//  Created by AVINASH on 18/07/26.
//

import Foundation
import FactoryKit

// MARK: - Services

extension Container {
    
    var apiClient: Factory<APIClient> {
        self {
            APIClientImpl(
                session: URLSession.shared,
                requestBuilder: RequestBuilder(),
                responseParser: ResponseParser()
            )
        }
        .singleton
    }
    
    var keychainService: Factory<KeychainService> {
        self {
            KeychainServiceImpl()
        }
        .singleton
    }
    
    var webSocketService: Factory<WebSocketService> {
        self {
            WebSocketServiceImpl(
                session: URLSession.shared
            )
        }
        .singleton
    }
}

// MARK: - Repositories

extension Container {
    
    var authRepository: Factory<AuthRepository> {
        self {
            AuthRepositoryImpl(
                apiClient: self.apiClient()
            )
        }
        .singleton
    }
    
    var conversationRepository: Factory<ConversationRepository> {
        self {
            ConversationRepositoryImpl(
                apiClient: self.apiClient()
            )
        }
        .singleton
    }
    
    var messageRepository: Factory<MessageRepository> {
        self {
            MessageRepositoryImpl(
                apiClient: self.apiClient()
            )
        }
        .singleton
    }
}

// MARK: - Use Cases

extension Container {
    
    var loginUseCase: Factory<LoginUseCase> {
        self {
            LoginUseCaseImpl(
                repository: self.authRepository()
            )
        }
    }
    
    var getConversationsUseCase: Factory<GetConversationsUseCase> {
        self {
            GetConversationsUseCaseImpl(
                repository: self.conversationRepository()
            )
        }
    }
    
    var getMessagesUseCase: Factory<GetMessagesUseCase> {
        self {
            GetMessagesUseCaseImpl(
                repository: self.messageRepository()
            )
        }
    }
}

// MARK: - ViewModels

extension Container {
    
    var loginViewModel: Factory<LoginViewModel> {
        self {
            LoginViewModel(
                loginUseCase: self.loginUseCase(),
                keychainService: self.keychainService()
            )
        }
    }
    
    var chatViewModel: Factory<ChatViewModel> {
        self {
            ChatViewModel(
                getConversationsUseCase: self.getConversationsUseCase(),
                webSocketService: self.webSocketService()
            )
        }
    }
    
    /// Factory for ChatDetailViewModel
    /// Conversation is passed at runtime.
    func chatDetailViewModel(
        conversation: Conversation
    ) -> ChatDetailViewModel {

        ChatDetailViewModel(
            conversation: conversation,
            getMessagesUseCase: self.getMessagesUseCase(),
            webSocketService: self.webSocketService(),
            keychainService: self.keychainService()
        )
    }
}

// MARK: - Validators

extension Container {
    
    @MainActor
    var loginValidator: Factory<EmailValidator> {
        self {
            EmailValidator()
        }
    }
}
