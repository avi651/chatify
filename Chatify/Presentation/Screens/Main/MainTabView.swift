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

        ZStack(alignment: .bottom) {

            currentScreen
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(theme.colors.background)
                .ignoresSafeArea()

            FloatingTabBar(
                selectedTab: $selectedTab
            )
            .padding(.bottom, AppSize.s20)
        }
        .animation(
            .spring(
                response: 0.35,
                dampingFraction: 0.80
            ),
            value: selectedTab
        )
        .onAppear {
            print("✅ MainTabView appeared")
        }
        .onDisappear {
            print("❌ MainTabView disappeared")
        }
    }
}

// MARK: - Private

private extension MainTabView {

    @ViewBuilder
    var currentScreen: some View {

        switch selectedTab {

        case .chats:
            ChatView()

        case .settings:
            SettingsView()
        }
    }
}

#Preview {
    MainTabView()
}
