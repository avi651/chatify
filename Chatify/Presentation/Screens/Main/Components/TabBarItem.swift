//
//  TabBarItem.swift
//  Chatify
//
//  Created by AVINASH on 20/07/26.
//

import SwiftUI

struct TabBarItem: View {

    let tab: AppTab
    let isSelected: Bool
    let action: () -> Void

    var body: some View {

        Button(action: action) {

            VStack(spacing: AppSize.s4) {

                Image(systemName: isSelected ? tab.selectedIcon : tab.icon)
                    .font(
                        FontManager.semiBold(
                            size: AppSize.sp20
                        )
                    )

                Text(tab.title)
                    .textStyle(
                        isSelected
                        ? theme.typography.smallBold
                        : theme.typography.mini
                    )
            }
            .foregroundStyle(
                isSelected
                ? theme.colors.primary.v70
                : theme.colors.textSecondary
            )
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background {

                if isSelected {

                    Capsule()
                        .fill(
                            theme.colors.primary.v10
                        )
                        .padding(.horizontal, AppSize.s4)
                }
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

#Preview {

    HStack(spacing: AppSize.s8) {

        TabBarItem(
            tab: .chats,
            isSelected: true
        ) {

        }

        TabBarItem(
            tab: .settings,
            isSelected: false
        ) {

        }
    }
    .padding()
}
