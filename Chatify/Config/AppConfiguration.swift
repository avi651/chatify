//
//  Environment.swift
//  Chatify
//
//  Created by AVINASH on 13/07/26.
//

import Foundation

enum AppConfiguration {

    static var baseURL: URL {

        guard let urlString = Bundle.main.object(
            forInfoDictionaryKey: "BASE_URL"
        ) as? String else {
            fatalError("BASE_URL Missing")
        }

        let finalURL: String

        if urlString.hasPrefix("http") {
            finalURL = urlString
        } else {
            finalURL = "http://\(urlString)"
        }

        guard let url = URL(string: finalURL) else {
            fatalError("Invalid BASE_URL: \(finalURL)")
        }

        return url
    }

    static var websocketURL: URL {

        guard let urlString = Bundle.main.object(
            forInfoDictionaryKey: "WEBSOCKET_URL"
        ) as? String else {
            fatalError("WEBSOCKET_URL Missing")
        }

        let finalURL: String

        if urlString.hasPrefix("ws") {
            finalURL = urlString
        } else {
            finalURL = "ws://\(urlString)"
        }

        guard let url = URL(string: finalURL) else {
            fatalError("Invalid WEBSOCKET_URL: \(finalURL)")
        }

        return url
    }
}
