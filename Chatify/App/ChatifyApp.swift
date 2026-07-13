//
//  ChatifyApp.swift
//  Chatify
//
//  Created by AVINASH on 13/07/26.
//

import SwiftUI

@main
struct ChatifyApp: App {

    @State
    private var coordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(coordinator: coordinator)
                .environment(coordinator)
        }
    }
}
