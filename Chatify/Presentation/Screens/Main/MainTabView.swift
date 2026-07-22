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
                // ❌ Remove this
                //.ignoresSafeArea()

            FloatingTabBar(
                selectedTab: $selectedTab
            )
            .padding(.horizontal, AppSize.s20)
            .padding(.bottom, AppSize.s20)
        }
        .background(theme.colors.background)
        .animation(
            .spring(response: 0.35, dampingFraction: 0.8),
            value: selectedTab
        )
    }
}

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
