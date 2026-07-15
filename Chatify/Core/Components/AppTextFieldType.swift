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

    var isSecure: Bool {
        self == .password
    }

    var submitLabel: SubmitLabel {
        switch self {
        case .search:
            return .search

        default:
            return .next
        }
    }
}
