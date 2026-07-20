//
//  LoginRequest.swift
//  Chatify
//
//  Created by AVINASH on 19/07/26.
//

import Foundation

struct LoginRequest: Encodable {
    let email: String
    let password: String
}
