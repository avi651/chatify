//
//  AppCoordinator.swift
//  Chatify
//
//  Created by AVINASH on 14/07/26.
//

import Observation

@Observable
@MainActor
final class AppCoordinator: BaseCoordinator<AppRoute> {
    
    func showLogin(){
        push(.login)
    }
    
    func showHome() {
        popToRoot()
        push(.home)
    }
}
