//
//  URLSessionProtocol.swift
//  Chatify
//
//  Created by AVINASH on 19/07/26.
//

import Foundation

protocol URLSessionProtocol {

    /// Performs a network request and returns the response data.
    ///
    /// - Parameter request: The URL request to execute.
    /// - Returns: A tuple containing the response data and URL response.
    func data(
        for request: URLRequest
    ) async throws -> (Data, URLResponse)
}

// MARK: - URLSession Conformance

extension URLSession: URLSessionProtocol { }
