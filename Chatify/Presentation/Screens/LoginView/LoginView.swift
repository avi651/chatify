//
//  LoginView.swift
//  Chatify
//
//  Created by AVINASH on 13/07/26.
//

import SwiftUI

struct LoginView: View {
    
    @State private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Login Screen")
            Button("Go Home") {
                viewModel.email = "avinash@gmail.com"
                viewModel.password = "12345678"

                print(viewModel.isLoginEnabled)
                print(viewModel.emailError?.localizedDescription ?? "No Error")
                print("Password Error:",
                          viewModel.passwordError?.localizedDescription ?? "No Error")
            }
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    LoginView()
        .environment(AppCoordinator())
}
