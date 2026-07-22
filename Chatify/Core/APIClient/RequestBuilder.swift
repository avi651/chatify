//
//  RequestBuilder.swift
//  Chatify
//
//  Created by AVINASH on 19/07/26.
//

import Foundation

struct RequestBuilder {

    // MARK: - Properties

    private let configuration: NetworkConfiguration

    // MARK: - Initializer

    init(
        configuration: NetworkConfiguration = NetworkConfiguration()
    ) {
        self.configuration = configuration
    }

    // MARK: - Build Request

    func build(
        endpoint: Endpoint
    ) throws -> URLRequest {

        guard var components = URLComponents(
            url: configuration.baseURL.appendingPathComponent(endpoint.path),
            resolvingAgainstBaseURL: false
        ) else {
            throw NetworkError.invalidURL
        }

        components.queryItems = endpoint.queryItems?.isEmpty == false
            ? endpoint.queryItems
            : nil

        guard let url = components.url else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)

        request.httpMethod = endpoint.method.rawValue
        request.timeoutInterval = endpoint.timeout

        // MARK: Default Headers

        endpoint.headers.forEach { key, value in
            request.setValue(
                value,
                forHTTPHeaderField: key
            )
        }

        // MARK: Authorization Header

        try attachAuthorizationHeader(
            to: &request
        )

        // MARK: HTTP Body

        try buildBody(
            endpoint.body,
            into: &request
        )

        return request
    }
}

// MARK: - Private

private extension RequestBuilder {

    func attachAuthorizationHeader(
        to request: inout URLRequest
    ) throws {

        let keychain = KeychainServiceImpl()

        guard let token = try keychain.read(
            for: .accessToken
        ),
        !token.isEmpty else {
            return
        }

        request.setValue(
            "Bearer \(token)",
            forHTTPHeaderField: "Authorization"
        )
    }

    func buildBody(
        _ body: HTTPBody?,
        into request: inout URLRequest
    ) throws {

        guard let body else {
            return
        }

        switch body {

        case .json(let body):

            request.httpBody = try configuration.encoder.encode(body)

        case .raw(let data):

            request.httpBody = data

        case .formURLEncoded(let data):

            request.httpBody = data

            request.setValue(
                "application/x-www-form-urlencoded",
                forHTTPHeaderField: "Content-Type"
            )

        case .multipart(let form):

            request.httpBody = form.bodyData

            request.setValue(
                form.contentType,
                forHTTPHeaderField: "Content-Type"
            )

        case .empty:

            request.httpBody = nil
        }
    }
}
