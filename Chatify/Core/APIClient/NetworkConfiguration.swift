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
        decoder: JSONDecoder = {

            let decoder = JSONDecoder()

            let formatter = ISO8601DateFormatter()
            formatter.formatOptions = [
                .withInternetDateTime,
                .withFractionalSeconds
            ]

            decoder.dateDecodingStrategy = .custom { decoder in

                let container = try decoder.singleValueContainer()
                let value = try container.decode(String.self)

                guard let date = formatter.date(from: value) else {

                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid ISO8601 date."
                    )
                }

                return date
            }

            return decoder

        }(),
        encoder: JSONEncoder = JSONEncoder()
    ) {
        self.baseURL = baseURL
        self.timeoutInterval = timeoutInterval
        self.decoder = decoder
        self.encoder = encoder
    }
}
