//
//  RegisterViewModel.swift
//  Chatify
//
//  Created by AVINASH on 18/07/26.
//

import Foundation
import Combine

@MainActor
final class RegisterViewModel: ObservableObject {

    // MARK: - Input

    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""

    // MARK: - Errors

    @Published var nameError: String?
    @Published var emailError: String?
    @Published var passwordError: String?
    @Published var confirmPasswordError: String?

    // MARK: - State

    @Published var isLoading = false
    @Published var shouldNavigateToHome = false

    // MARK: - Dependencies

    private let nameValidator = NameValidator()
    private let emailValidator = EmailValidator()
    private let passwordValidator = PasswordValidator()
    private let confirmPasswordValidator = ConfirmPasswordValidator()

    // MARK: - Register

    func register() {

        clearErrors()

        validateName()
        validateEmail()
        validatePassword()
        validateConfirmPassword()

        guard isValid else {
            return
        }

        registerUser()
    }
}

private extension RegisterViewModel {

    func validateName() {

        do {
            try nameValidator.validate(name)
        } catch {
            nameError = error.localizedDescription
        }
    }

    func validateEmail() {

        do {
            try emailValidator.validate(email)
        } catch {
            emailError = error.localizedDescription
        }
    }

    func validatePassword() {

        do {
            try passwordValidator.validate(password)
        } catch {
            passwordError = error.localizedDescription
        }
    }

    func validateConfirmPassword() {

        do {
            try confirmPasswordValidator.validate(
                password: password,
                confirmPassword: confirmPassword
            )
        } catch {
            confirmPasswordError = error.localizedDescription
        }
    }

    var isValid: Bool {

        nameError == nil &&
        emailError == nil &&
        passwordError == nil &&
        confirmPasswordError == nil
    }
}

private extension RegisterViewModel {

    func registerUser() {

        Task {

            isLoading = true

            defer {
                isLoading = false
            }

            // TODO:
            // await AuthRepository.register()

            try? await Task.sleep(for: .seconds(2))

            shouldNavigateToHome = true
        }
    }
    
    private func clearErrors() {
            nameError = nil
            emailError = nil
            passwordError = nil
            confirmPasswordError = nil
        }
}
