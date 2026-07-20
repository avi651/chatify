//
//  ChatView.swift
//  Chatify
//
//  Created by AVINASH on 20/07/26.
//


import SwiftUI

struct ChatView: View {

    var body: some View {

        NavigationStack {

            ZStack {

                theme.colors.background
                    .ignoresSafeArea()

                Text("Chats")
                    .textStyle(theme.typography.h2)
            }
            .navigationTitle("Chats")
        }
    }
}

#Preview {

    ChatView()
}
