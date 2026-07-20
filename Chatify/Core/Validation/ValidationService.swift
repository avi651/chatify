//
//  ValidationService.swift
//  Chatify
//
//  Created by AVINASH on 18/07/26.
//

import Foundation

final class ValidationService: ValidationServiceProtocol {

    private let emailValidator = EmailValidator()
    private let passwordValidator = PasswordValidator()
    private let nameValidator = NameValidator()
    private let confirmPasswordValidator = ConfirmPasswordValidator()

    func validateEmail(_ email: String) throws {
        try emailValidator.validate(email)
    }

    func validatePassword(_ password: String) throws {
        try passwordValidator.validate(password)
    }

    func validateName(_ name: String) throws {
        try nameValidator.validate(name)
    }

    func validateConfirmPassword(
        password: String,
        confirmPassword: String
    ) throws {
        try confirmPasswordValidator.validate(
            password: password,
            confirmPassword: confirmPassword
        )
    }
}
