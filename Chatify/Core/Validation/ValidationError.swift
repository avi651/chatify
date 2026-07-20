//
//  ValidationError.swift
//  Chatify
//
//  Created by AVINASH on 15/07/26.
//


import Foundation

enum ValidationError: LocalizedError {

    case emptyName
    case invalidName

    case emptyEmail
    case invalidEmail

    case emptyPassword
    case weakPassword

    case emptyConfirmPassword
    case passwordsDoNotMatch

    var errorDescription: String? {

        switch self {

        case .emptyName:
            return "Name is required."

        case .invalidName:
            return "Enter a valid name."

        case .emptyEmail:
            return "Email is required."

        case .invalidEmail:
            return "Enter a valid email."

        case .emptyPassword:
            return "Password is required."

        case .weakPassword:
            return "Password must be at least 8 characters."

        case .emptyConfirmPassword:
            return "Confirm password is required."

        case .passwordsDoNotMatch:
            return "Passwords do not match."
        }
    }
}
