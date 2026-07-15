//
//  PhoneValidator.swift
//  Chatify
//
//  Created by AVINASH on 15/07/26.
//

import Foundation

enum PhoneValidator {

    static func validate(_ phone: String) throws {

        guard !phone.isEmpty else {
            throw ValidationError.emptyPhone
        }

        let regex = #"^[0-9]{10}$"#

        let isValid = NSPredicate(
            format: "SELF MATCHES %@",
            regex
        ).evaluate(with: phone)

        guard isValid else {
            throw ValidationError.invalidPhone
        }
    }
}
