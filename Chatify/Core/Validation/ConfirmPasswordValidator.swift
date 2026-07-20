//
//  ConfirmPasswordValidator.swift
//  Chatify
//
//  Created by AVINASH on 18/07/26.
//

import Foundation

struct ConfirmPasswordValidator {

    func validate(
        password: String,
        confirmPassword: String
    ) throws {

        let password = password.trimmingCharacters(in: .whitespacesAndNewlines)
        let confirmPassword = confirmPassword.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !confirmPassword.isEmpty else {
            throw ValidationError.emptyConfirmPassword
        }

        guard password == confirmPassword else {
            throw ValidationError.passwordsDoNotMatch
        }
    }
}
