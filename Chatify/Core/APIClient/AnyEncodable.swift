//
//  AnyEncodable.swift
//  Chatify
//
//  Created by AVINASH on 19/07/26.
//

import Foundation

struct AnyEncodable: Encodable {

    private let encodeClosure: (Encoder) throws -> Void

    init<T: Encodable>(_ value: T) {
        self.encodeClosure = value.encode
    }

    func encode(to encoder: Encoder) throws {
        try encodeClosure(encoder)
    }
}
