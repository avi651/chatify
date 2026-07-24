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

    @State
    private var searchText = ""

    var body: some View {

        NavigationStack {

            List {

                ForEach(filteredConversations) { conversation in

                    NavigationLink {

                        ChatDetailView(
                            conversation: conversation
                        )

                    } label: {

                        ChatRowView(conversation: conversation)
                    }
                }
            }
            .overlay {

                if viewModel.isLoading {
                    ProgressView()
                }
            }
            .listStyle(.plain)
            .navigationTitle("Chats")
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $searchText)
            .safeAreaPadding(.bottom, 110)
            .refreshable {
                await viewModel.loadConversations()
            }
        }
        .task {

            await viewModel.loadConversations()

            connectWebSocket()
        }
    }
}

// MARK: - Private

private extension ChatView {

    var filteredConversations: [Conversation] {

        guard !searchText.isEmpty else {
            return viewModel.conversations
        }

        return viewModel.conversations.filter {
            $0.participantName.localizedCaseInsensitiveContains(searchText)
        }
    }

    func connectWebSocket() {

        do {

            guard let token = try keychainService.read(
                for: .accessToken
            ) else {
                return
            }

            viewModel.connect(token: token)

        } catch {
            print(error)
        }
    }
}
