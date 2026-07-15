//
//  LoginViewModelTests.swift
//  ChatifyTests
//
//  Created by AVINASH on 15/07/26.
//

import Testing
@testable import Chatify

@MainActor
struct LoginViewModelTests {
    
    @Test("Email should be empty initially")
    func emailShouldBeEmptyInitially() {
        let sut = LoginViewModel()
        
        #expect(sut.email.isEmpty)
    }
    
    @Test("Password should be empty initially")
    func passwordShouldBeEmptyInitially() {
        let sut = LoginViewModel()
        
        #expect(sut.password.isEmpty)
    }
    
    @Test("Login button should be disabled initially")
    func loginButtonShouldBeDisabledInitially() {
        let sut = LoginViewModel()
        
        #expect(sut.isLoginEnabled == false)
    }
    
    @Test("Login button should be enabled for valid email and password")
    func loginButtonShouldBeEnabled() {
        let sut = LoginViewModel()
            
        sut.email = "abc@gmail.com"
        sut.password = "123456"
            
        #expect(sut.isLoginEnabled)
    }
    
    @Test("Login button should be disabled when email is empty")
    func loginButtonShouldBeDisabledForEmptyEmail() {
        
        let sut = LoginViewModel()
        
        sut.email = ""
        sut.password = "123456"
        
        #expect(!sut.isLoginEnabled)
    }
    
    @Test("Login button should be disabled when password is empty")
    func loginButtonShouldBeDisabledForEmptyPassword() {
        let sut = LoginViewModel()
        
        sut.email = "abc@gmail.com"
        sut.password = ""
        
        #expect(!sut.isLoginEnabled)
    }
    
    @Test("Valid email should pass")
    func validEmailShouldPass() {
        #expect(EmailValidator.isValid("avinash@gmail.com"))
    }
    
    @Test("Invalid email should fail")
    func invalidEmailShouldFail() {
        #expect(!EmailValidator.isValid("avinash"))
    }
    
    @Test("Empty email should fail")
    func emptyEmailShouldFail() {
        #expect(!EmailValidator.isValid(""))
    }
}
