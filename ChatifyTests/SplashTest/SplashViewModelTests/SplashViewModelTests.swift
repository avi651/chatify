//
//  SplashViewModelTests.swift
//  ChatifyTests
//
//  Created by AVINASH on 14/07/26.
//

import Testing
@testable import Chatify

@MainActor
struct SplashViewModelTests {
    @Test
    func shouldNavigateAfterDelay() async {
        let vm = SplashViewModel()
        await vm.start()
        
        #expect(vm.shouldNavigate == true)
    }
    
    @Test
    func shouldNotNavigateInitially() {
        let vm = SplashViewModel()
        
        #expect(vm.shouldNavigate == false)
    }
}
