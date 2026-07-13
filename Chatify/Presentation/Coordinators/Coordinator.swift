//
//  Coordinator.swift
//  Chatify
//
//  Created by AVINASH on 13/07/26.
//

import SwiftUI

@MainActor
protocol Coordinator: AnyObject {
    associatedtype Route: Hashable
    var path: NavigationPath { get set }
    func start()
    func push(_ route: Route)
    func pop()
    func popToRoot()
}
