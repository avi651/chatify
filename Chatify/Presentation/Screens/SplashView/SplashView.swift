//
//  SplashView.swift
//  Chatify
//
//  Created by AVINASH on 13/07/26.
//

import SwiftUI

struct SplashView: View {

    var body: some View {

        VStack {
            Text("Chatify")

            Text("http: \(Environment.baseURL.absoluteString)")
            Text("ws: \(Environment.websocketURL.absoluteString)")
        }
        .onAppear {

            print("=========== INFO ===========")

            print(Bundle.main.infoDictionary ?? [:])

            print("BASE_URL ->",
                  Bundle.main.object(forInfoDictionaryKey: "BASE_URL") ?? "nil")

            print("WEBSOCKET_URL ->",
                  Bundle.main.object(forInfoDictionaryKey: "WEBSOCKET_URL") ?? "nil")

            print("============================")
            
            let storage = KeychainService()

            try? storage.save("Avinash", for: KeychainKeys.userId)

            print(try? storage.get(for: KeychainKeys.userId))

        }
    }
}
