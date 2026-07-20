//
//  SettingsView.swift
//  Chatify
//
//  Created by AVINASH on 20/07/26.
//

import SwiftUI

struct SettingsView: View {

    var body: some View {

        NavigationStack {

            ZStack {

                theme.colors.background
                    .ignoresSafeArea()

                Text("Settings")
                    .textStyle(theme.typography.h2)
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {

    SettingsView()
}
