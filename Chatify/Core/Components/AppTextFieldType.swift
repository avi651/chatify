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
    case phone
    case search

    // MARK: - Title

    var title: String {
        switch self {
        case .name:
            return "Full Name"

        case .email:
            return "Email"

        case .password:
            return "Password"

        case .phone:
            return "Phone Number"

        case .search:
            return "Search"
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

        case .phone:
            return "Enter your phone number"

        case .search:
            return "Search"
        }
    }

    // MARK: - Keyboard

    var keyboardType: UIKeyboardType {
        switch self {
        case .email:
            return .emailAddress

        case .phone:
            return .phonePad

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

        case .password:
            return .password

        case .phone:
            return .telephoneNumber

        case .search:
            return nil
        }
    }

    // MARK: - Secure

    var isSecure: Bool {
        self == .password
    }

    // MARK: - Submit

    var submitLabel: SubmitLabel {
        switch self {
        case .search:
            return .search

        default:
            return .next
        }
    }

    // MARK: - Auto Capitalization

    var textInputAutocapitalization: TextInputAutocapitalization {
        switch self {
        case .name:
            return .words

        case .email, .password, .phone, .search:
            return .never
        }
    }

    // MARK: - Auto Correction

    var autocorrectionDisabled: Bool {
        switch self {
        case .email, .password, .search:
            return true

        case .name, .phone:
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

        case .password:
            return "lock"

        case .phone:
            return "phone"

        case .search:
            return "magnifyingglass"
        }
    }
}
