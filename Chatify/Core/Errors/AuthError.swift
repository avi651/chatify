//
//  AuthError.swift
//  Chatify
//
//  Created by AVINASH on 19/07/26.
//

import Foundation

enum AuthError: LocalizedError, Equatable, Identifiable {
    var id: Self { self }
    case invalidApiKey
    case tokenExpired
    case sessionDenied
    case userDetail
    case invalidUsernamePassword
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidApiKey:
            return "Oops! Please check your API Key. It's an invalid API Key"
        case .tokenExpired:
            return "Token is expired or invalid"
        case .sessionDenied:
            return "Session denied"
        case .userDetail:
            return "Failed to get user"
        case .invalidUsernamePassword:
            return "Please check your username and/or password"
        case .unknown:
            return "Something went wrong"
        }
    }
}
