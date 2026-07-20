//
//  PasswordValidator.swift
//  Chatify
//
//  Created by AVINASH on 15/07/26.
//


import Foundation

struct PasswordValidator: Validator {

    func validate(_ password: String) throws {

        let password = password.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !password.isEmpty else {
            throw ValidationError.emptyPassword
        }

        guard password.count >= 8 else {
            throw ValidationError.weakPassword
        }
    }
}
