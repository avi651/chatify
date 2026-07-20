//
//  NetworkConfiguration.swift
//  Chatify
//
//  Created by AVINASH on 19/07/26.
//

import Foundation

struct NetworkConfiguration {

    /// Base URL for all API requests.
    let baseURL: URL

    /// Default timeout interval.
    let timeoutInterval: TimeInterval

    /// JSON decoder used for API responses.
    let decoder: JSONDecoder

    /// JSON encoder used for request bodies.
    let encoder: JSONEncoder

    init(
        baseURL: URL = AppConfiguration.baseURL,
        timeoutInterval: TimeInterval = 30,
        decoder: JSONDecoder = JSONDecoder(),
        encoder: JSONEncoder = JSONEncoder()
    ) {
        self.baseURL = baseURL
        self.timeoutInterval = timeoutInterval
        self.decoder = decoder
        self.encoder = encoder
    }
}
