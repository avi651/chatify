//
//  RootView.swift
//  Chatify
//
//  Created by AVINASH on 17/07/26.
//


import SwiftUI
import Observation

struct RootView: View {

    @Environment(AppCoordinator.self)
    private var coordinator

    var body: some View {

        @Bindable var coordinator = coordinator

        NavigationStack(path: $coordinator.path) {

            Group {

                switch coordinator.root {

                case .splash:
                    SplashView()

                case .login:
                    LoginView()

                case .main:
                    MainTabView()
                }
            }
            .navigationDestination(for: AppRoute.self) { route in

                switch route {

                case .register:
                    RegisterView()

                case .chat:
                    ChatView()
                }
            }
        }
    }
}
