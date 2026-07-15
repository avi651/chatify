//
//  AppTextField.swift
//  Chatify
//
//  Created by AVINASH on 15/07/26.
//


import SwiftUI

struct AppTextField: View {

    let type: AppTextFieldType

    @Binding
    var text: String

    @State
    private var hidePassword = true

    var body: some View {

        HStack(spacing: AppSpacing.sm) {

            field

            if type.isSecure {

                Button {

                    hidePassword.toggle()

                } label: {

                    Image(
                        systemName: hidePassword
                        ? "eye.slash"
                        : "eye"
                    )
                    .foregroundStyle(AppColors.secondaryText)

                }
                .buttonStyle(.plain)
            }

        }
        .padding(.horizontal, AppSpacing.md)
        .frame(height: AppSize.textFieldHeight)
        .background(AppColors.textFieldBackground)
        .clipShape(
            RoundedRectangle(
                cornerRadius: AppSize.cornerRadius
            )
        )
        .overlay(
            RoundedRectangle(
                cornerRadius: AppSize.cornerRadius
            )
            .stroke(
                AppColors.textFieldBorder,
                lineWidth: 1
            )
        )
        .accessibilityIdentifier(accessibilityIdentifier)
    }

    @ViewBuilder
    private var field: some View {

        if type.isSecure && hidePassword {

            SecureField(type.title, text: $text)

        } else {

            TextField(type.title, text: $text)

        }
    }
}

private extension AppTextField {

    var accessibilityIdentifier: String {

        switch type {

        case .name:
            return "name_textfield"

        case .email:
            return "email_textfield"

        case .password:
            return "password_textfield"

        case .phone:
            return "phone_textfield"

        case .search:
            return "search_textfield"
        }
    }
}

#Preview {

    @Previewable @State var name = ""
    @Previewable @State var email = ""
    @Previewable @State var password = ""
    @Previewable @State var phone = ""
    @Previewable @State var search = ""

    VStack(spacing: AppSpacing.md) {

        AppTextField(
            type: .name,
            text: $name
        )

        AppTextField(
            type: .email,
            text: $email
        )

        AppTextField(
            type: .password,
            text: $password
        )

        AppTextField(
            type: .phone,
            text: $phone
        )

        AppTextField(
            type: .search,
            text: $search
        )
    }
    .padding()
}
