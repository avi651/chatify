//
//  RegisterView.swift
//  Chatify
//
//  Created by AVINASH on 17/07/26.
//


import SwiftUI

struct RegisterView: View {

    @Environment(AppCoordinator.self)
    private var coordinator

    @StateObject
    private var viewModel = RegisterViewModel()

    var body: some View {

        ScrollView(showsIndicators: false) {

            VStack(alignment: .leading, spacing: AppSize.s24) {

                Spacer()
                    .frame(height: AppSize.s40)

                AuthHeaderView(
                    title: "Create Account",
                    subTitle: "Create your Chatify account"
                )

                VStack(spacing: AppSize.s16) {

                    AppTextField(
                        .name,
                        text: $viewModel.name,
                        error: viewModel.nameError
                    )

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

                    AppTextField(
                        .confirmPassword,
                        text: $viewModel.confirmPassword,
                        error: viewModel.confirmPasswordError
                    )
                }

                PrimaryButton(
                    title: "Create Account",
                    isLoading: viewModel.isLoading
                ) {
                    Task {
                        viewModel.register()
                    }
                }

                AuthFooterView(
                    title: "Already have an account?",
                    actionTitle: "Login"
                ) {
                    coordinator.pop()
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
            guard shouldNavigate else { return }
            coordinator.showLogin()
        }
    }
}

#Preview {
    RegisterView()
        .environment(AppCoordinator())
}
