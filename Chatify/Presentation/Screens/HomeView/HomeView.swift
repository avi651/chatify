//
//  HomeView.swift
//  Chatify
//
//  Created by AVINASH on 13/07/26.
//

import SwiftUI

struct HomeView: View {

    @Environment(AppCoordinator.self)
    private var coordinator

    var body: some View {

        VStack(spacing: AppSize.s24) {

            Spacer()

            Image(systemName: "message.fill")
                .font(.system(size: 72))
                .foregroundStyle(theme.colors.primary.v60)

            Text("Welcome to Chatify")
                .textStyle(theme.typography.h2)

            Text("You have successfully logged in.")
                .textStyle(theme.typography.body)
                .foregroundStyle(theme.colors.textSecondary)

            PrimaryButton(title: "Logout") {

                coordinator.showLogin()
            }
            .padding(.horizontal, AppSize.s24)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(theme.colors.background)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
        .environment(AppCoordinator())
}
