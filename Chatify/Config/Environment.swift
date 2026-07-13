//
//  Environment.swift
//  Chatify
//
//  Created by AVINASH on 13/07/26.
//

import Foundation

enum Environment {

    static var baseURL: URL {
        guard let url = Bundle.main.object(
            forInfoDictionaryKey: "BASE_URL"
        ) as? String else {
            fatalError("BASE_URL Missing")
        }

        return URL(string: url)!
    }

    static var websocketURL: URL {
        guard let url = Bundle.main.object(
            forInfoDictionaryKey: "WEBSOCKET_URL"
        ) as? String else {
            fatalError("WEBSOCKET_URL Missing")
        }

        return URL(string: url)!
    }
}
