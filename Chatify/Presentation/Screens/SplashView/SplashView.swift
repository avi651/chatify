//
//  SplashView.swift
//  Chatify
//
//  Created by AVINASH on 13/07/26.
//

import SwiftUI

struct SplashView: View {

    // MARK: - Properties

    @State private var viewModel = SplashViewModel()
    @State private var scale: CGFloat = 0.85
    @State private var opacity: Double = 0.5

    @Environment(AppCoordinator.self)
    private var coordinator

    // MARK: - Body

    var body: some View {

        ZStack {

            theme.colors.background
                .ignoresSafeArea()

            VStack {

                Spacer()

                VStack(spacing: AppSize.s16) {

                    Image(systemName: "message.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                        .foregroundStyle(theme.colors.primary.v60)
                        .scaleEffect(scale)
                        .opacity(opacity)

                    Text("Chatify")
                        .textStyle(theme.typography.h2)

                }

                Spacer()

                VStack(spacing: AppSize.s12) {

                    ProgressView()

                    Text("Loading...")
                        .textStyle(theme.typography.body)
                        .foregroundStyle(theme.colors.textSecondary)

                }
            }
            .padding(AppSize.s24)
        }
        .onAppear {
            startAnimation()
        }
        .task {
            await viewModel.start()
        }
        .onChange(of: viewModel.shouldNavigate) { _, value in
            guard value else { return }
            coordinator.showLogin()
        }
    }
}

// MARK: - Private

private extension SplashView {

    func startAnimation() {

        withAnimation(
            .easeInOut(duration: 1.2)
                .repeatForever(autoreverses: true)
        ) {

            scale = 1.0
            opacity = 1.0

        }
    }
}

#Preview {
    SplashView()
        .environment(AppCoordinator())
}
