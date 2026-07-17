//
//  RootView.swift
//  Chatify
//
//  Created by AVINASH on 17/07/26.
//

import SwiftUI

struct RootView: View {
    @Environment(AppCoordinator.self) private var coordinator
    var body: some View {
        switch coordinator.route {
           case .splash:
              SplashView()
            case .login:
               LoginView()
             case .register:
               RegisterView()
             case .home:
                HomeView()
            
        }
    }
}
