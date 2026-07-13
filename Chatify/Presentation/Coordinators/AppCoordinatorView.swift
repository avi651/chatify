//
//  AppCoordinatorView.swift
//  Chatify
//
//  Created by AVINASH on 13/07/26.
//

import SwiftUI

struct AppCoordinatorView: View {
    @Bindable var coordinator: AppCoordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            SplashView()
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .splash:
                        SplashView()
                    case .login:
                        LoginView()
                    case .home:
                        HomeView()
                    }
                }
        }
    }
}
