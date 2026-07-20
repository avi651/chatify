//
//  AuthRepository.swift
//  Chatify
//
//  Created by AVINASH on 19/07/26.
//

import Foundation

protocol AuthRepository {

    func login(
        email: String,
        password: String
    ) async throws -> AuthToken
}
