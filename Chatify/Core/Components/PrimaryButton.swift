//
//  PrimaryButton.swift
//  Chatify
//
//  Created by AVINASH on 15/07/26.
//

import SwiftUI

struct PrimaryButton: View {

    let title: String
    let isLoading: Bool
    let isEnabled: Bool
    let action: () -> Void

    init(
        title: String,
        isLoading: Bool = false,
        isEnabled: Bool = true,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.isLoading = isLoading
        self.isEnabled = isEnabled
        self.action = action
    }

    private var backgroundColor: Color {
        isEnabled
        ? theme.colors.primary.v60
        : theme.colors.neutral.v40
    }

    var body: some View {

        Button {

            guard !isLoading else { return }
            action()

        } label: {

            ZStack {

                Text(title)
                    .textStyle(theme.typography.bodyBold)
                    .foregroundStyle(.white)
                    .opacity(isLoading ? 0 : 1)

                if isLoading {
                    ProgressView()
                        .tint(.white)
                }

            }
            .frame(maxWidth: .infinity)
            .frame(height: AppSize.buttonMedium)
            .background(backgroundColor)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: AppSize.r12
                )
            )
        }
        .disabled(!isEnabled || isLoading)
        .accessibilityIdentifier("primary_button")
    }
}

#Preview {

    VStack(spacing: AppSize.s16) {

        PrimaryButton(title: "Login") {

        }

        PrimaryButton(
            title: "Loading",
            isLoading: true
        ) {

        }

        PrimaryButton(
            title: "Disabled",
            isEnabled: false
        ) {

        }

    }
    .padding()
}
