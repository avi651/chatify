//
//  ValidationError.swift
//  Chatify
//
//  Created by AVINASH on 15/07/26.
//


import Foundation

enum ValidationError: LocalizedError {

    case emptyEmail
    case invalidEmail

    case emptyPassword
    case weakPassword

    case emptyName
    case invalidName

    case emptyPhone
    case invalidPhone

    case emptyOTP
    case invalidOTP

    var errorDescription: String? {

        switch self {

        case .emptyEmail:
            return "Email is required."

        case .invalidEmail:
            return "Please enter a valid email."

        case .emptyPassword:
            return "Password is required."

        case .weakPassword:
            return "Password must contain at least 8 characters."

        case .emptyName:
            return "Name is required."

        case .invalidName:
            return "Please enter a valid name."

        case .emptyPhone:
            return "Phone number is required."

        case .invalidPhone:
            return "Please enter a valid phone number."

        case .emptyOTP:
            return "OTP is required."

        case .invalidOTP:
            return "OTP must be 6 digits."

        }
    }
}
