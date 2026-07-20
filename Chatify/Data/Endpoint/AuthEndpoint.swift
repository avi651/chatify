//
//  AuthEndpoint.swift
//  Chatify
//
//  Created by Avinash Kumar.
//

import Foundation

enum AuthEndpoint: Endpoint {

    case login(LoginRequest)

    var path: String {
        switch self {

        case .login:
            return "/api/v1/auth/login"
        }
    }

    var method: HTTPMethod {
        switch self {

        case .login:
            return .post
        }
    }

    var headers: [String : String] {
        switch self {

        case .login:
            return [
                "Accept": "application/json",
                "Content-Type": "application/json"
            ]
        }
    }

    var queryItems: [URLQueryItem]? {
        nil
    }

    var body: HTTPBody? {

        switch self {
        case .login(let request):
            return .json(AnyEncodable(request))
        }
    }

    var timeout: TimeInterval {
        30
    }
}
