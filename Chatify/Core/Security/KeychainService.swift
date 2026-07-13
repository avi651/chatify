//
//  KeychainService.swift
//  Chatify
//
//  Created by AVINASH on 13/07/26.
//

import Foundation
import KeychainAccess

final class KeychainService: SecureStorage {

    private let keychain = Keychain(service: Bundle.main.bundleIdentifier!)

    func save(_ value: String, for key: String) throws {
        try keychain.set(value, key: key)
    }

    func get(for key: String) throws -> String? {
        try keychain.get(key)
    }

    func delete(for key: String) throws {
        try keychain.remove(key)
    }
}
