//
//  AppCoordinator.swift
//  Chatify
//
//  Created by AVINASH on 17/07/26.
//

import Observation

@Observable
@MainActor
final class AppCoordinator {

    var route: AppRoute = .splash

    func showSplash() {
        route = .splash
    }

    func showLogin() {
        route = .login
    }

    func showRegister() {
        route = .register
    }

    func showHome() {
        route = .home
    }
}
