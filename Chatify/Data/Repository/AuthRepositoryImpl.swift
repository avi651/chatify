//
//  AuthRepositoryImpl.swift
//  Chatify
//
//  Created by AVINASH on 19/07/26.
//

import Foundation

final class AuthRepositoryImpl: AuthRepository {

    // MARK: - Properties

    private let apiClient: APIClient

    // MARK: - Initializer

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    // MARK: - Login

    func login(
        email: String,
        password: String
    ) async throws -> AuthToken {

        let request = LoginRequest(
            email: email,
            password: password
        )

        let response: LoginResponse = try await apiClient.request(
            AuthEndpoint.login(request)
        )

        return response.toDomain()
    }
}
