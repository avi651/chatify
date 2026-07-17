//
//  ForgotPassword.swift
//  Chatify
//
//  Created by AVINASH on 17/07/26.
//

import SwiftUI

struct ForgotPasswordButton: View {
    let action: () -> Void
    var body: some View {

        HStack {
            Spacer()
            Button(action: action) {
                Text("Forgot Password?")
                    .textStyle(theme.typography.small)
            }
        }
    }
}

#Preview {
    ForgotPasswordButton {

    }
    .padding()
}

