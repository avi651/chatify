//
//  SplashView.swift
//  Chatify
//
//  Created by AVINASH on 13/07/26.
//

import SwiftUI

struct SplashView: View {

    @State private var viewModel = SplashViewModel()
    @State private var scale: CGFloat = 0.8
    @State private var opacity: Double = 0.5

    @Environment(AppCoordinator.self)
    private var coordinator

    var body: some View {

        ZStack {

            AppColors.background
                .ignoresSafeArea()

            VStack(spacing: AppSpacing.lg) {

                Spacer()

                VStack(spacing: AppSpacing.md) {

                    Image(systemName: AppImages.splashLogo)
                        .resizable()
                        .scaledToFit()
                        .frame(
                            width: AppSize.splashLogo,
                            height: AppSize.splashLogo
                        )
                        .foregroundStyle(AppColors.primary)
                        .scaleEffect(scale)
                        .opacity(opacity)

                    Text(AppStrings.appName)
                        .font(AppFont.title)
                        .foregroundStyle(AppColors.primaryText)
                }

                Spacer()

                VStack(spacing: AppSpacing.sm) {

                    ProgressView()

                    Text(AppStrings.loading)
                        .font(AppFont.body)
                        .foregroundStyle(AppColors.secondaryText)
                }

            }
            .padding(AppSpacing.md)
        }
        .onAppear {

            withAnimation(
                .easeInOut(duration: 1)
                .repeatForever(autoreverses: true)
            ) {
                scale = 1.0
                opacity = 1.0
            }
        }
        .task {
            await viewModel.start()
        }
        .onChange(of: viewModel.shouldNavigate) { _, navigate in
            guard navigate else { return }
            coordinator.showLogin()
        }
    }
}
