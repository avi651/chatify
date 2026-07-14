//
//  SplashViewModel.swift
//  ChatifyTests
//
//  Created by AVINASH on 14/07/26.
//

import Observation

@Observable
@MainActor
final class SplashViewModel {
    var shouldNavigate = false
    
    func start() async {
        try? await Task.sleep(for: .seconds(2))
        shouldNavigate = true
    }
}
