//
//  APIClient.swift
//  Chatify
//
//  Created by AVINASH on 19/07/26.
//

import Foundation

/// Generic Network Client
///
/// Responsible for executing network requests and
/// decoding the response into the requested model.
protocol APIClient {

    /// URLSession used to perform requests.
    var session: URLSessionProtocol { get }

    /// Executes a network request.
    ///
    /// - Parameter endpoint: Endpoint configuration.
    /// - Returns: Decoded response model.
    func request<T: Decodable>(
        _ endpoint: Endpoint
    ) async throws -> T
}
