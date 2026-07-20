//
//  AppTextFieldType.swift
//  Chatify
//
//  Created by AVINASH on 15/07/26.
//

import SwiftUI

enum AppTextFieldType {
    case name
    case email
    case password
    case confirmPassword

    // MARK: - Title

    var title: String {
        switch self {
        case .name:
            return "Full Name"

        case .email:
            return "Email"

        case .password:
            return "Password"
        
        case .confirmPassword:
                return "Confirm Password"
        }
    }

    // MARK: - Placeholder

    var placeholder: String {
        switch self {
        case .name:
            return "Enter your full name"

        case .email:
            return "Enter your email"

        case .password:
            return "Enter your password"
        
        case .confirmPassword:
            return "Enter your confirm password"

        }
    }

    // MARK: - Keyboard

    var keyboardType: UIKeyboardType {
        switch self {
        case .email:
            return .emailAddress

        default:
            return .default
        }
    }

    // MARK: - Content Type

    var textContentType: UITextContentType? {
        switch self {
        case .name:
            return .name

        case .email:
            return .emailAddress

        case .password, .confirmPassword:
            return .password
        }
    }

    // MARK: - Secure

    var isSecure: Bool {
        self == .password
    }

    // MARK: - Submit

    var submitLabel: SubmitLabel {
        switch self {

        case .name:
            return .next

        case .email:
            return .next

        case .password:
            return .next

        case .confirmPassword:
            return .done
        }
    }

    // MARK: - Auto Capitalization

    var textInputAutocapitalization: TextInputAutocapitalization {
        switch self {
        case .name:
            return .words

        case .email, .password, .confirmPassword:
            return .never
        }
    }

    // MARK: - Auto Correction

    var autocorrectionDisabled: Bool {
        switch self {
        case .email, .password, .confirmPassword:
            return true

        case .name:
            return false
        }
    }

    // MARK: - SF Symbol

    var icon: String {
        switch self {
        case .name:
            return "person"

        case .email:
            return "envelope"

        case .password, .confirmPassword:
            return "lock"
        }
    }
}
