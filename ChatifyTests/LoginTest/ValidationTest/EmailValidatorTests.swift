//
//  EmailValidatorTests.swift
//  ChatifyTests
//
//  Created by AVINASH on 15/07/26.
//

import Testing
@testable import Chatify

struct EmailValidatorTests {
    
    @Test("Empty email should be invalid")
    func emptyEmailShouldBeInvalid(){
        #expect(!EmailValidator.isValid(""))
    }
    
    @Test("Invalid email without @ should be invalid")
    func invalidEmailWithoutAt() {
        #expect(!EmailValidator.isValid("avinashgmail.com"))
    }
    
    @Test("Invalid email without domain should be invalid")
    func invalidEmailWithoutDomain() {
        #expect(!EmailValidator.isValid("avinash@"))
    }
    
    @Test("Invalid email without username should be invalid")
    func invalidEmailWithoutUsername() {
        #expect(!EmailValidator.isValid("@gmail.com"))
    }
    
    @Test("Valid email should pass validation")
    func validEmailShouldPass() {
        #expect(EmailValidator.isValid("avinash@gmail.com"))
    }
}
