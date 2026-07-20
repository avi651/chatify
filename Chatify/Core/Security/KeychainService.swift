//
//  KeychainService.swift
//  Chatify
//
//  Created by AVINASH on 20/07/26.
//

import Foundation

protocol KeychainService {

    func save(
        _ value: String,
        for key: KeychainKey
    ) throws

    func read(
        for key: KeychainKey
    ) throws -> String?

    func delete(
        for key: KeychainKey
    ) throws

    func deleteAll() throws
}
