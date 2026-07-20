//
//  ResponseParser.swift
//  Chatify
//
//  Created by AVINASH on 19/07/26.
//

import Foundation

struct ResponseParser {

    private let decoder: JSONDecoder

    init(
        decoder: JSONDecoder = NetworkConfiguration().decoder
    ) {
        self.decoder = decoder
    }

    func parse<T: Decodable>(
        _ data: Data
    ) throws -> T {

        do {

            return try decoder.decode(
                T.self,
                from: data
            )

        } catch let error as DecodingError {

            #if DEBUG
            print("❌ Decoding Error: \(error)")
            #endif

            throw NetworkError.decodingError

        } catch {

            throw NetworkError.unknown(error)
        }
    }
}
