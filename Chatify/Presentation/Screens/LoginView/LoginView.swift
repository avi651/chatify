//
//  LoginView.swift
//  Chatify
//
//  Created by AVINASH on 13/07/26.
//

import SwiftUI

struct LoginView: View {
    
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Login Screen")
            Button("Go Home") {
            
            }
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    LoginView()
        .environment(AppCoordinator())
}
