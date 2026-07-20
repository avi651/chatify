//
//  ValidationService.swift
//  Chatify
//
//  Created by AVINASH on 18/07/26.
//

import Foundation

protocol ValidationServiceProtocol {
    func validateEmail(_ email: String) throws
    func validatePassword(_ password: String) throws
    func validateName(_ name: String) throws
    func validateConfirmPassword(
        password: String,
        confirmPassword: String
    ) throws
}
