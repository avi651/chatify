//
//  AppCoordinator.swift
//  Chatify
//
//  Created by AVINASH on 17/07/26.
//



import SwiftUI
import Observation

@Observable
final class AppCoordinator {

    // MARK: - Root Navigation

    var root: RootRoute = .splash

    // MARK: - Push Navigation

    var path = NavigationPath()

    // MARK: - Root

    func showSplash() {

        root = .splash
        path = NavigationPath()
    }

    func showLogin() {

        root = .login
        path = NavigationPath()
    }

    func showMain() {

        root = .main
        path = NavigationPath()
    }

    // MARK: - Push

    func showRegister() {

        path.append(AppRoute.register)
    }

    func showChat() {

        path.append(AppRoute.chat)
    }

    // MARK: - Pop

    func pop() {

        guard !path.isEmpty else { return }
        path.removeLast()
    }

    func popToRoot() {

        path = NavigationPath()
    }
}
