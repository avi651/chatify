//
//  Data+Converter.swift
//  Chatify
//
//  Created by AVINASH on 19/07/26.
//

import Foundation

extension Encodable {
    func toJSON(_ encoder: JSONEncoder = JSONEncoder()) throws -> String {
        let data = try encoder.encode(self)
        let result = String(decoding: data, as: UTF8.self)
        return result
    }
}

