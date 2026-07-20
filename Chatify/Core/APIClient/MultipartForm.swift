//
//  MultipartForm.swift
//  Chatify
//
//  Created by AVINASH on 19/07/26.
//

import Foundation

struct MultipartForm {

    // MARK: - Nested Types

    enum Field {

        case text(
            name: String,
            value: String
        )

        case file(MultipartFile)
    }

    // MARK: - Properties

    let boundary: String

    private(set) var fields: [Field]

    // MARK: - Initializer

    init(
        boundary: String = UUID().uuidString,
        fields: [Field] = []
    ) {
        self.boundary = boundary
        self.fields = fields
    }

    // MARK: - Builder

    mutating func addText(
        name: String,
        value: String
    ) {
        fields.append(
            .text(
                name: name,
                value: value
            )
        )
    }

    mutating func addFile(
        _ file: MultipartFile
    ) {
        fields.append(
            .file(file)
        )
    }

    // MARK: - Content Type

    var contentType: String {
        "multipart/form-data; boundary=\(boundary)"
    }

    // MARK: - Body

    var bodyData: Data {

        var body = Data()

        for field in fields {

            body.append("--\(boundary)\r\n")

            switch field {

            case let .text(name, value):

                body.append(
                    "Content-Disposition: form-data; name=\"\(name)\"\r\n\r\n"
                )

                body.append(value)

                body.append("\r\n")

            case let .file(file):

                body.append(
                    """
                    Content-Disposition: form-data; name="\(file.name)"; filename="\(file.fileName)"
                    Content-Type: \(file.mimeType.rawValue)

                    """
                )

                body.append(file.data)

                body.append("\r\n")
            }
        }

        body.append("--\(boundary)--\r\n")

        return body
    }
}

// MARK: - Multipart File

struct MultipartFile {

    let name: String

    let fileName: String

    let mimeType: MIMEType

    let data: Data

    init(
        name: String,
        fileName: String,
        mimeType: MIMEType,
        data: Data
    ) {
        self.name = name
        self.fileName = fileName
        self.mimeType = mimeType
        self.data = data
    }
}

// MARK: - MIME Type

enum MIMEType: String {

    case jpeg = "image/jpeg"

    case png = "image/png"

    case gif = "image/gif"

    case pdf = "application/pdf"

    case json = "application/json"

    case text = "text/plain"

    case mp4 = "video/mp4"

    case mov = "video/quicktime"

    case octetStream = "application/octet-stream"
}

// MARK: - Data Extension

private extension Data {

    mutating func append(
        _ string: String
    ) {

        guard let data = string.data(
            using: .utf8
        ) else {
            return
        }

        append(data)
    }
}
