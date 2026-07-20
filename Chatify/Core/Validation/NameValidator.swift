//
//  NameValidator.swift
//  Chatify
//
//  Created by AVINASH on 15/07/26.
//

import Foundation

struct NameValidator: Validator {

    func validate(_ name: String) throws {

        let name = name.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !name.isEmpty else {
            throw ValidationError.emptyName
        }

        guard name.count >= 2 else {
            throw ValidationError.invalidName
        }

        let regex = #"^[A-Za-z ]+$"#

        let isValid = NSPredicate(
            format: "SELF MATCHES %@",
            regex
        ).evaluate(with: name)

        guard isValid else {
            throw ValidationError.invalidName
        }
    }
}
