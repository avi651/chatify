//
//  KeychainServiceImpl.swift
//  Chatify
//
//  Created by AVINASH on 20/07/26.
//

import Foundation
import Security

final class KeychainServiceImpl: KeychainService {

    private let service = Bundle.main.bundleIdentifier ?? "Chatify"

    func save(
        _ value: String,
        for key: KeychainKey
    ) throws {

        guard let data = value.data(using: .utf8) else {
            throw KeychainError.invalidData
        }

        // Remove existing value if present
        try? delete(for: key)

        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: key.rawValue,
            kSecValueData: data
        ]

        let status = SecItemAdd(query as CFDictionary, nil)

        guard status == errSecSuccess else {
            throw KeychainError.saveFailed(status)
        }
    }

    func read(
        for key: KeychainKey
    ) throws -> String? {

        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: key.rawValue,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne
        ]

        var result: CFTypeRef?

        let status = SecItemCopyMatching(
            query as CFDictionary,
            &result
        )

        switch status {

        case errSecSuccess:

            guard
                let data = result as? Data,
                let value = String(data: data, encoding: .utf8)
            else {
                throw KeychainError.invalidData
            }

            return value

        case errSecItemNotFound:
            return nil

        default:
            throw KeychainError.readFailed(status)
        }
    }

    func delete(
        for key: KeychainKey
    ) throws {

        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: key.rawValue
        ]

        let status = SecItemDelete(query as CFDictionary)

        guard
            status == errSecSuccess ||
            status == errSecItemNotFound
        else {
            throw KeychainError.deleteFailed(status)
        }
    }

    func deleteAll() throws {

        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service
        ]

        let status = SecItemDelete(query as CFDictionary)

        guard
            status == errSecSuccess ||
            status == errSecItemNotFound
        else {
            throw KeychainError.deleteFailed(status)
        }
    }
}
