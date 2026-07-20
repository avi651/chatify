//
//  MainTabView.swift
//  Chatify
//
//  Created by AVINASH on 20/07/26.
//

import SwiftUI

struct MainTabView: View {

    @State
    private var selectedTab: AppTab = .chats

    var body: some View {

        VStack(spacing: 0) {

            Group {

                switch selectedTab {

                case .chats:
                    ChatView()

                case .settings:
                    SettingsView()
                }
            }

            Divider()

            HStack {

                Button {

                    selectedTab = .chats

                } label: {

                    VStack(spacing: 4) {

                        Image(systemName: selectedTab == .chats
                              ? "message.fill"
                              : "message")

                        Text("Chats")
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity)
                }

                Button {

                    selectedTab = .settings

                } label: {

                    VStack(spacing: 4) {

                        Image(systemName: selectedTab == .settings
                              ? "gearshape.fill"
                              : "gearshape")

                        Text("Settings")
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.vertical, 12)
            .background(.ultraThinMaterial)
        }.onAppear {
            print("MainTabView appeared")
        }

        .onDisappear {
            print("MainTabView disappeared")
        }
    }
}

#Preview {
    MainTabView()
}
