//
//  EmailValidator.swift
//  Chatify
//
//  Created by AVINASH on 15/07/26.
//


import Foundation

struct EmailValidator: Validator {
    init() {}

    func validate(_ email: String) throws {

        guard !email.trimmingCharacters(in: .whitespaces).isEmpty else {
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
