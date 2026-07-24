//
//  WebSocketEnvelope.swift
//  Chatify
//
//  Created by AVINASH on 24/07/26.
//

import Foundation

struct WebSocketEnvelope: Codable {

    let type: String
    let data: SocketMessageDTO
}
