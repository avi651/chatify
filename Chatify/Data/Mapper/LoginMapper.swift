//
//  LoginMapper.swift
//  Chatify
//
//  Created by AVINASH on 19/07/26.
//

import Foundation

extension LoginResponse {

    func toDomain() -> AuthToken {

        AuthToken(
            accessToken: accessToken,
            tokenType: tokenType
        )
    }
}
