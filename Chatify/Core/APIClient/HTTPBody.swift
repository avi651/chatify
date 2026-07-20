//
//  HTTPBody.swift
//  Chatify
//
//  Created by AVINASH on 19/07/26.
//

import Foundation

enum HTTPBody {

    case json(AnyEncodable)

    case multipart(MultipartForm)

    case raw(Data)

    case formURLEncoded(Data)

    case empty
}
