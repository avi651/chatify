//
//  EmailValidator.swift
//  Chatify
//
//  Created by AVINASH on 15/07/26.
//


import Foundation

struct EmailValidator: Validator {

    func validate(_ email: String) throws {

        let email = email.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !email.isEmpty else {
            throw ValidationError.emptyEmail
        }

        let regex =
        #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#

        let isValid = NSPredicate(
            format: "SELF MATCHES %@",
            regex
        ).evaluate(with: email)

        guard isValid else {
            throw ValidationError.invalidEmail
        }
    }
}
