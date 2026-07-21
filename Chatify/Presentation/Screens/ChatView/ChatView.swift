//
//  ChatView.swift
//  Chatify
//
//  Created by AVINASH on 20/07/26.
//

import SwiftUI
import FactoryKit

struct ChatView: View {

    @StateObject
    private var viewModel = Container.shared.chatViewModel()

    @Injected(\.keychainService)
    private var keychainService

    var body: some View {

        List(viewModel.messages, id: \.self) { message in
            Text(message)
        }
        .navigationTitle("Chat")
        .task {
            connectWebSocket()
        }
        .safeAreaInset(edge: .bottom) {

            Button {

                sendTypingEvent()

            } label: {

                Text("Send")
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(.ultraThinMaterial)
        }
    }
}

// MARK: - Private

private extension ChatView {

    func connectWebSocket() {

        do {

            guard let token = try keychainService.read(for: .accessToken) else {
                print("❌ Access token not found")
                return
            }

            viewModel.connect(token: token)

        } catch {

            print("❌ Failed to read token: \(error.localizedDescription)")
        }
    }

    func sendTypingEvent() {

        let json = """
        {
            "type":"typing",
            "conversation_id":1,
            "is_typing":true
        }
        """

        viewModel.send(message: json)
    }
}
