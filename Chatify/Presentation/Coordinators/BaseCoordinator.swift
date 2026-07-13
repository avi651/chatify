//
//  BaseCoordinator.swift
//  Chatify
//
//  Created by AVINASH on 13/07/26.
//

import SwiftUI
import Observation

@Observable
@MainActor
class BaseCoordinator<Route: Hashable>: Coordinator {

    var path = NavigationPath()

    func start() {
        // Override in child coordinator
    }

    func push(_ route: Route) {
        path.append(route)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    func popToRoot() {
        path = NavigationPath()
    }
}
