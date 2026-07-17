//
//  LoginView.swift
//  Chatify
//
//  Created by AVINASH on 13/07/26.
//


import SwiftUI

struct LoginView: View {

    @StateObject private var viewModel = LoginViewModel()

    var body: some View {

        ScrollView(showsIndicators: false) {

            VStack(alignment: .leading, spacing: AppSize.s24) {

                Spacer()
                    .frame(height: AppSize.s40)

                AuthHeaderView(
                    title: "Welcome Back",
                    subTitle: "Sign in to continue to Chatify"
                )

                VStack(spacing: AppSize.s16) {

                    AppTextField(
                        .email,
                        text: $viewModel.email,
                        error: viewModel.emailError
                    )

                    AppTextField(
                        .password,
                        text: $viewModel.password,
                        error: viewModel.passwordError
                    )
                }

                ForgotPasswordButton {
                    viewModel.forgotPasswordTapped()
                }

                PrimaryButton(
                    title: "Login",
                    isLoading: viewModel.isLoading
                ) {
                    viewModel.login()
                }

                AuthFooterView(
                    title: "Don't have an account?",
                    actionTitle: "Sign Up"
                ) {
                    viewModel.signUpTapped()
                }

                Spacer()
            }
            .padding(.horizontal, AppSize.s24)
            .padding(.vertical, AppSize.s20)
        }.hideKeyboardOnTap()
        .background(theme.colors.background)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        LoginView()
    }
}
