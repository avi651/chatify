//
//  ConversationEndpoint.swift
//  Chatify
//
//  Created by AVINASH on 22/07/26.
//

import Foundation

enum ConversationEndpoint: Endpoint {

    case getConversations

    var path: String {
        switch self {

        case .getConversations:
            return "/api/v1/conversations"
        }
    }

    var method: HTTPMethod {
        switch self {

        case .getConversations:
            return .get
        }
    }

    var headers: [String : String] {

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
