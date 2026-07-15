//
//  NameValidator.swift
//  Chatify
//
//  Created by AVINASH on 15/07/26.
//


import Foundation

enum NameValidator {

    static func validate(_ name: String) throws {

        let value = name.trimmingCharacters(in: .whitespaces)

        guard !value.isEmpty else {
            throw ValidationError.emptyName
        }

        guard value.count >= 2 else {
            throw ValidationError.invalidName
        }
    }
}
