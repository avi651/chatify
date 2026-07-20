//
//  Endpoint.swift
//  Chatify
//
//  Created by AVINASH on 19/07/26.
//

import Foundation

protocol Endpoint {

    /// Relative path.
    ///
    /// Example:
    /// auth/login
    /// users/profile
    var path: String { get }

    /// HTTP Method
    var method: HTTPMethod { get }

    /// Headers
    var headers: [String: String] { get }

    /// Query Parameters
    var queryItems: [URLQueryItem]? { get }

    /// HTTP Body
    var body: HTTPBody? { get }

    /// Timeout
    var timeout: TimeInterval { get }
}

// MARK: - Default Values

extension Endpoint {

    var headers: [String: String] {

        [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
    }

    var queryItems: [URLQueryItem]? {
        nil
    }

    var body: HTTPBody? {
        nil
    }

    var timeout: TimeInterval {
        30
    }
}
