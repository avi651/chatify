//
//  Coordinator.swift
//  Chatify
//
//  Created by AVINASH on 14/07/26.
//

import SwiftUI

@MainActor
protocol Coordinator: AnyObject {
    associatedtype Route: Hashable
    var path: NavigationPath { get set }
    func push(_ route: Route)
    func pop()
    func popToRoot()
}

