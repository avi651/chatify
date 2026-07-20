//
//  LoginView.swift
//  Chatify
//
//  Created by AVINASH on 13/07/26.
//

import SwiftUI
import FactoryKit

struct LoginView: View {

    @Environment(AppCoordinator.self)
    private var coordinator

    @State
    private var viewModel = Container.shared.loginViewModel()

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
                    // TODO
                }

                PrimaryButton(
                    title: "Login",
                    isLoading: viewModel.isLoading
                ) {

                    Task {
                        await viewModel.login()
                    }
                }

                AuthFooterView(
                    title: "Don't have an account?",
                    actionTitle: "Sign Up"
                ) {

                    coordinator.showRegister()
                }

                Spacer()
            }
            .padding(.horizontal, AppSize.s24)
            .padding(.vertical, AppSize.s20)
        }
        .hideKeyboardOnTap()
        .background(theme.colors.background)
        .navigationBarBackButtonHidden(true)
        .onChange(of: viewModel.shouldNavigateToHome) { _, shouldNavigate in

            guard shouldNavigate else {
                return
            }
            
            print("Navigate to Main")
            coordinator.showMain()
        }
    }
}

#Preview {

    LoginView()
        .environment(AppCoordinator())
}
