//
//  LoginViewModel.swift
//  Chatify
//
//  Created by AVINASH on 15/07/26.
//

import SwiftUI
import Combine

@MainActor
final class LoginViewModel: ObservableObject {
    
    // MARK: - Input
    
    @Published var email = ""
    @Published var password = ""
    
    // MARK: - Output
    
    @Published var emailError: String?
    @Published var passwordError: String?
    
    @Published var isLoading = false
    
    // MARK: - Login
    
    func login() {
        emailError = nil
        passwordError = nil
        
        do {
            try EmailValidator().validate(email)
        } catch {
            emailError = error.localizedDescription
        }
        
        do {
            try PasswordValidator().validate(password)
        } catch {
            passwordError = error.localizedDescription
        }
        
        guard emailError == nil,
              passwordError == nil else {
            return
        }
        
        Task {
            isLoading = true
            defer { isLoading = false }
            
            try? await Task.sleep(for: .seconds(2))
            print("Login Success")
        }
    }
    
    // MARK: - Actions

        func forgotPasswordTapped() {
            // TODO: Coordinator Navigation
        }

        func signUpTapped() {
            // TODO: Coordinator Navigation
        }
}
