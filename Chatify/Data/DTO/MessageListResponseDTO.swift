//
//  MessageListResponseDTO.swift
//  Chatify
//
//  Created by AVINASH on 24/07/26.
//

import Foundation

struct MessageListResponseDTO: Decodable {

    let messages: [MessageDTO]
    let hasMore: Bool

    enum CodingKeys: String, CodingKey {
        case messages
        case hasMore = "has_more"
    }
}
