//
//  LoginViewModel.swift
//  Chatify
//
//  Created by AVINASH on 15/07/26.
//


import Foundation
import Observation

@Observable
@MainActor
final class LoginViewModel {

    // MARK: - Input

    var email = "" {
        didSet {
            validateEmail()
        }
    }

    var password = "" {
        didSet {
            validatePassword()
        }
    }

    // MARK: - Output

    var emailError: ValidationError?
    var passwordError: ValidationError?

    var isLoading = false
    var error: Error?

    // MARK: - Validators

    private let emailValidator = EmailValidator()
    private let passwordValidator = PasswordValidator()

    // MARK: - Computed Properties

    var isLoginEnabled: Bool {
        emailError == nil &&
        passwordError == nil &&
        !email.isEmpty &&
        !password.isEmpty &&
        !isLoading
    }

    // MARK: - Public Methods

    func login() async {

        guard validate() else {
            return
        }

        isLoading = true

        defer {
            isLoading = false
        }

        do {

            // TODO:
            // let response = try await loginUseCase.execute(
            //     email: email,
            //     password: password
            // )

        } catch {

            self.error = error
        }
    }

    func reset() {

        email = ""
        password = ""

        emailError = nil
        passwordError = nil

        error = nil
        isLoading = false
    }
}

// MARK: - Private Methods

private extension LoginViewModel {

    func validate() -> Bool {

        validateEmail()
        validatePassword()

        return isLoginEnabled
    }

    func validateEmail() {

        do {

            try emailValidator.validate(email)

            emailError = nil

        } catch let error as ValidationError {

            emailError = error

        } catch {

            emailError = .invalidEmail
        }
    }

    func validatePassword() {

        do {

            try passwordValidator.validate(password)

            passwordError = nil

        } catch let error as ValidationError {

            passwordError = error

        } catch {

            passwordError = .weakPassword
        }
    }
}
