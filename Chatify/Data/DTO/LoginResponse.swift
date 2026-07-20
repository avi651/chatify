//
//  LoginResponse.swift
//  Chatify
//
//  Created by AVINASH on 19/07/26.
//

import Foundation

struct LoginResponse: Decodable {
    let accessToken: String
    let tokenType: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
    }
}
