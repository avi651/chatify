//
//  AppCoordinator.swift
//  Chatify
//
//  Created by AVINASH on 13/07/26.
//

import SwiftUI

@MainActor
final class AppCoordinator: BaseCoordinator<AppRoute> {
    override func start() {
        push(.splash)
    }
}
