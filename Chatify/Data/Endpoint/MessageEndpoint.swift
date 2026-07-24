//
//  MessageEndpoint.swift
//  Chatify
//
//  Created by AVINASH on 24/07/26.
//

import Foundation

enum MessageEndpoint: Endpoint {

    case getMessages(String)

    var path: String {
        switch self {

        case .getMessages(let conversationId):
            return "/api/v1/messages/conversation/\(conversationId)"
        }
    }

    var method: HTTPMethod {
        switch self {

        case .getMessages:
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
