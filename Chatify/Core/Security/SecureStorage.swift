//
//  SecureStorage.swift
//  Chatify
//
//  Created by AVINASH on 13/07/26.
//

import Foundation

protocol SecureStorage {
    func save(_ value: String, for key: String) throws
    func get(for key: String) throws -> String?
    func delete(for key: String) throws
}
