//
//  AppTextField.swift
//  Chatify
//
//  Created by AVINASH on 15/07/26.
//

import SwiftUI

struct AppTextField: View {

    // MARK: - Properties

    let type: AppTextFieldType
    let error: String?

    @Binding var text: String

    @State private var isSecure = true

    // MARK: - Initializer

    init(
        _ type: AppTextFieldType,
        text: Binding<String>,
        error: String? = nil
    ) {
        self.type = type
        self._text = text
        self.error = error
        self._isSecure = State(initialValue: type.isSecure)
    }

    // MARK: - Body

    var body: some View {

        VStack(alignment: .leading, spacing: AppSize.s8) {

            Text(type.title)
                .textStyle(theme.typography.smallBold)

            HStack(spacing: AppSize.s12) {

                Image(systemName: iconName)
                    .foregroundStyle(theme.colors.textSecondary)
                    .frame(width: 20)

                Group {

                    if type.isSecure {

                        if isSecure {

                            SecureField(type.title, text: $text)

                        } else {

                            TextField(type.title, text: $text)

                        }

                    } else {

                        TextField(type.title, text: $text)

                    }

                }
                .textInputAutocapitalization(type.textInputAutocapitalization)
                .autocorrectionDisabled(type.autocorrectionDisabled)
                .keyboardType(type.keyboardType)
                .submitLabel(type.submitLabel)

                if type.isSecure {

                    Button {

                        isSecure.toggle()

                    } label: {

                        Image(systemName: isSecure ? "eye.slash" : "eye")
                            .foregroundStyle(theme.colors.textSecondary)

                    }

                }

            }
            .padding(.horizontal, AppSize.s16)
            .frame(height: AppSize.textFieldHeight)
            .background(theme.colors.surface)
            .overlay(
                RoundedRectangle(cornerRadius: AppSize.r12)
                    .stroke(
                        error == nil
                        ? theme.colors.border
                        : theme.colors.error.v60,
                        lineWidth: 1
                    )
            )
            .clipShape(
                RoundedRectangle(cornerRadius: AppSize.r12)
            )

            if let error {

                Text(error)
                    .font(.caption)
                    .foregroundStyle(theme.colors.error.v60)

            }

        }
    }

    // MARK: - Private

    private var iconName: String {

        switch type {

        case .name:
            return "person"

        case .email:
            return "envelope"

        case .password:
            return "lock"

        case .phone:
            return "phone"

        case .search:
            return "magnifyingglass"

        }

    }
}

#Preview {

    VStack(spacing: AppSize.s20) {

        AppTextField(
            .name,
            text: .constant("")
        )

        AppTextField(
            .email,
            text: .constant("")
        )

        AppTextField(
            .password,
            text: .constant("")
        )

        AppTextField(
            .phone,
            text: .constant("")
        )

        AppTextField(
            .search,
            text: .constant("")
        )

        AppTextField(
            .email,
            text: .constant("avinash@gmail.com"),
            error: "Invalid email address"
        )

    }
    .padding()
}
