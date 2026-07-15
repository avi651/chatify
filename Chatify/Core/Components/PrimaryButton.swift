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

    var body: some View {
        Button(action: action) {
            Group {
                if isLoading {
                    ProgressView()
                        .tint(.white)
                } else {
                    Text(title)
                        .font(AppFont.body)
                        .fontWeight(.semibold)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: AppSize.buttonHeight)
        }
        .buttonStyle(.borderedProminent)
        .clipShape(
            RoundedRectangle(cornerRadius: AppSize.cornerRadius)
        )
        .disabled(!isEnabled || isLoading)
        .accessibilityIdentifier("primary_button")
    }
}

#Preview {
    VStack(spacing: AppSpacing.md) {

        PrimaryButton(title: "Login") {

        }

        PrimaryButton(
            title: "Loading...",
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

#Preview {
    PrimaryButton(title: "Login", isLoading: false, isEnabled: false) { }
        .padding()
}
