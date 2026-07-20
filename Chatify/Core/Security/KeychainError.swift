//
//  KeychainError.swift
//  Chatify
//
//  Created by AVINASH on 20/07/26.
//

import Foundation

enum KeychainError: LocalizedError {

    case invalidData
    case saveFailed(OSStatus)
    case readFailed(OSStatus)
    case deleteFailed(OSStatus)
    case itemNotFound

    var errorDescription: String? {

        switch self {

        case .invalidData:
            return "Unable to encode value."

        case .saveFailed(let status):
            return "Failed to save item. Status: \(status)"

        case .readFailed(let status):
            return "Failed to read item. Status: \(status)"

        case .deleteFailed(let status):
            return "Failed to delete item. Status: \(status)"

        case .itemNotFound:
            return "Item not found."
        }
    }
}
