//
//  AuthFooterView.swift
//  Chatify
//
//  Created by AVINASH on 17/07/26.
//

import SwiftUI

struct AuthFooterView: View {

    let title: String
    let actionTitle: String
    let action: () -> Void

    var body: some View {

        HStack(spacing: AppSize.s4) {
            Spacer()
            Text(title)
                .textStyle(theme.typography.body)
            Button(action: action) {
                Text(actionTitle)
                    .textStyle(theme.typography.smallBold)
            }
            Spacer()
        }
    }
}

#Preview {

    AuthFooterView(
        title: "Don't have an account?",
        actionTitle: "Sign Up"
    ) {

    }
    .padding()
}
