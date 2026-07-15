//
//  PasswordValidator.swift
//  Chatify
//
//  Created by AVINASH on 15/07/26.
//


import Foundation

struct PasswordValidator: Validator {
    
    init() {}

    func validate(_ password: String) throws {

        guard !password.isEmpty else {
            throw ValidationError.emptyPassword
        }

        guard password.count >= 8 else {
            throw ValidationError.weakPassword
        }
    }
}
