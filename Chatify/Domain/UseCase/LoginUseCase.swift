//
//  LoginUseCase.swift
//  Chatify
//
//  Created by AVINASH on 19/07/26.
//

import Foundation

protocol LoginUseCase {

    func execute(
        email: String,
        password: String
    ) async throws -> AuthToken
}
