//
//  LoginUseCaseImpl.swift
//  Chatify
//
//  Created by AVINASH on 19/07/26.
//

import Foundation

final class LoginUseCaseImpl: LoginUseCase {

    // MARK: - Properties

    private let repository: AuthRepository

    // MARK: - Initializer

    init(
        repository: AuthRepository
    ) {
        self.repository = repository
    }

    // MARK: - Execute

    func execute(
        email: String,
        password: String
    ) async throws -> AuthToken {

        try await repository.login(
            email: email,
            password: password
        )
    }
}
