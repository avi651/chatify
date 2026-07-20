//
//  NetworkError.swift
//  Chatify
//
//  Created by AVINASH on 19/07/26.
//

import Foundation

enum NetworkError: Error {

    /// URL could not be created.
    case invalidURL

    /// Server returned an invalid response.
    case invalidResponse

    /// HTTP status code is not successful (2xx).
    case httpError(Int)

    /// Failed to encode request body.
    case encodingError

    /// Failed to decode response.
    case decodingError

    /// No internet connection.
    case noInternet

    /// Request timed out.
    case requestTimeout

    /// Request was cancelled.
    case cancelled

    /// Unknown error.
    case unknown(Error)
}

// MARK: - LocalizedError

extension NetworkError: LocalizedError {

    var errorDescription: String? {

        switch self {

        case .invalidURL:
            return "Invalid URL."

        case .invalidResponse:
            return "Invalid server response."

        case .httpError(let code):
            return "Server returned status code \(code)."

        case .encodingError:
            return "Failed to encode request."

        case .decodingError:
            return "Failed to decode response."

        case .noInternet:
            return "No internet connection."

        case .requestTimeout:
            return "The request timed out."

        case .cancelled:
            return "The request was cancelled."

        case .unknown(let error):
            return error.localizedDescription
        }
    }
}
