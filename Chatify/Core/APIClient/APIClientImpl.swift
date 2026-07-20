//
//  APIClientImpl.swift
//  Chatify
//
//  Created by AVINASH on 19/07/26.
//

import Foundation

final class APIClientImpl: APIClient {

    let session: URLSessionProtocol

    private let requestBuilder: RequestBuilder
    private let responseParser: ResponseParser

    init(
        session: URLSessionProtocol,
        requestBuilder: RequestBuilder,
        responseParser: ResponseParser
    ) {
        self.session = session
        self.requestBuilder = requestBuilder
        self.responseParser = responseParser
    }
    // MARK: - Request

    func request<T: Decodable>(
        _ endpoint: Endpoint
    ) async throws -> T {

        let request = try requestBuilder.build(
            endpoint: endpoint
        )

        do {

            let (data, response) = try await session.data(
                for: request
            )

            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }

            guard (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.httpError(httpResponse.statusCode)
            }

            return try responseParser.parse(data)

        } catch let error as NetworkError {

            throw error

        } catch let error as DecodingError {

            print("❌ Decoding Error:", error)

            throw NetworkError.decodingError

        } catch {

            throw NetworkError.unknown(error)
        }
    }
}
