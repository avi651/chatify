//
//  HTTPMethod.swift
//  Chatify
//
//  Created by AVINASH on 19/07/26.
//

import Foundation

/// Represents supported HTTP methods.
enum HTTPMethod: String {

    /// Retrieves data from the server.
    case get = "GET"

    /// Creates a new resource.
    case post = "POST"

    /// Replaces an existing resource.
    case put = "PUT"

    /// Partially updates an existing resource.
    case patch = "PATCH"

    /// Deletes a resource.
    case delete = "DELETE"
}
