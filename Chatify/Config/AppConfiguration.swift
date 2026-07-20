import Foundation

enum AppConfiguration {

    static var baseURL: URL {
        makeURL(
            schemeKey: "API_SCHEME",
            hostKey: "API_HOST",
            portKey: "API_PORT"
        )
    }

    static var websocketURL: URL {
        makeURL(
            schemeKey: "WS_SCHEME",
            hostKey: "WS_HOST",
            portKey: "WS_PORT",
            pathKey: "WS_PATH"
        )
    }
}

// MARK: - Private

private extension AppConfiguration {

    static func makeURL(
        schemeKey: String,
        hostKey: String,
        portKey: String,
        pathKey: String? = nil
    ) -> URL {

        guard
            let scheme = Bundle.main.object(forInfoDictionaryKey: schemeKey) as? String,
            let host = Bundle.main.object(forInfoDictionaryKey: hostKey) as? String,
            let portString = Bundle.main.object(forInfoDictionaryKey: portKey) as? String,
            let port = Int(portString)
        else {
            fatalError("Invalid configuration")
        }

        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.port = port

        if let pathKey,
           let path = Bundle.main.object(forInfoDictionaryKey: pathKey) as? String {
            components.path = path
        }

        guard let url = components.url else {
            fatalError("Unable to create URL")
        }

        return url
    }
}
