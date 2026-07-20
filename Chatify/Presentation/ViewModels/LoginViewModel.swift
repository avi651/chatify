import Foundation
import Observation

@Observable
final class LoginViewModel {

    // MARK: - Dependencies

    private let loginUseCase: LoginUseCase
    private let keychainService: KeychainService

    // MARK: - Validators

    private let emailValidator = EmailValidator()
    private let passwordValidator = PasswordValidator()

    // MARK: - Form

    var email = ""
    var password = ""

    // MARK: - Validation Errors

    var emailError: String?
    var passwordError: String?

    // MARK: - UI State

    var isLoading = false
    var shouldNavigateToHome = false

    // MARK: - Init

    init(
        loginUseCase: LoginUseCase,
        keychainService: KeychainService
    ) {
        self.loginUseCase = loginUseCase
        self.keychainService = keychainService
    }

    // MARK: - Login

    func login() async {

        clearErrors()

        guard validate() else {
            return
        }

        isLoading = true
        defer { isLoading = false }

        do {

            let response = try await loginUseCase.execute(
                email: email,
                password: password
            )
            
            try keychainService.save(
                response.accessToken,
                for: .accessToken
            )

            shouldNavigateToHome = true

        } catch {

            passwordError = error.localizedDescription
        }
    }
}

// MARK: - Private

private extension LoginViewModel {

    func clearErrors() {

        emailError = nil
        passwordError = nil
    }

    func validate() -> Bool {

        var isValid = true

        do {
            try emailValidator.validate(email)
        } catch {
            emailError = error.localizedDescription
            isValid = false
        }

        do {
            try passwordValidator.validate(password)
        } catch {
            passwordError = error.localizedDescription
            isValid = false
        }

        return isValid
    }
}
