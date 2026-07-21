//
//  FloatingTabBar.swift
//  Chatify
//
//  Created by AVINASH on 20/07/26.
//

import SwiftUI

struct FloatingTabBar: View {

    @Binding
    var selectedTab: AppTab

    var body: some View {

        HStack(spacing: AppSize.s4) {

            ForEach(AppTab.allCases, id: \.self) { tab in

                TabBarItem(
                    tab: tab,
                    isSelected: selectedTab == tab
                ) {

                    withAnimation(
                        .spring(
                            response: 0.35,
                            dampingFraction: 0.80
                        )
                    ) {

                        selectedTab = tab
                    }
                }
            }
        }
        .padding(.horizontal, AppSize.s8)
        .padding(.vertical, AppSize.s8)
        .background(.ultraThinMaterial)
        .clipShape(Capsule())
        .overlay {

            Capsule()
                .stroke(
                    theme.colors.border,
                    lineWidth: AppSize.borderThin
                )
        }
        .shadow(
            color: .black.opacity(0.08),
            radius: 16,
            x: 0,
            y: 8
        )
        .padding(.horizontal, AppSize.s20)
    }
}

#Preview {

    @Previewable
    @State var selectedTab: AppTab = .chats

    ZStack(alignment: .bottom) {

        theme.colors.background
            .ignoresSafeArea()

        FloatingTabBar(
            selectedTab: $selectedTab
        )
        .padding(.bottom, AppSize.s20)
    }
}
