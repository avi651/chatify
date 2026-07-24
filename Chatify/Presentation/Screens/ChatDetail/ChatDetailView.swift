//
//  ChatDetailView.swift
//  Chatify
//
//  Created by AVINASH on 24/07/26.
//

import SwiftUI
import FactoryKit

struct ChatDetailView: View {

    // MARK: - State

    @StateObject
    private var viewModel: ChatDetailViewModel

    // MARK: - Initializer

    init(
        conversation: Conversation
    ) {
        _viewModel = StateObject(
            wrappedValue: Container.shared.chatDetailViewModel(
                conversation: conversation
            )
        )
    }

    // MARK: - Body

    var body: some View {

        Group {

            if viewModel.isLoading {

                ProgressView()

            } else if let error = viewModel.errorMessage {

                ContentUnavailableView(
                    "Error",
                    systemImage: "exclamationmark.triangle",
                    description: Text(error)
                )

            } else {

                ScrollView {

                    LazyVStack(
                        spacing: 12
                    ) {

                        ForEach(viewModel.messages) { message in

                            HStack {

                                if message.isMine {

                                    Spacer()

                                    Text(message.text ?? "📷 Image")
                                        .padding(.horizontal, 14)
                                        .padding(.vertical, 10)
                                        .foregroundStyle(.white)
                                        .background(Color.blue)
                                        .clipShape(
                                            RoundedRectangle(
                                                cornerRadius: 18
                                            )
                                        )

                                } else {

                                    Text(message.text ?? "📷 Image")
                                        .padding(.horizontal, 14)
                                        .padding(.vertical, 10)
                                        .background(Color(.systemGray5))
                                        .clipShape(
                                            RoundedRectangle(
                                                cornerRadius: 18
                                            )
                                        )

                                    Spacer()
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle(viewModel.navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.onAppear()
        }
        .onDisappear {
            viewModel.onDisappear()
        }
    }
}
