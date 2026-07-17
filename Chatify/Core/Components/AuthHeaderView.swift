//
//  AuthHeaderView.swift
//  Chatify
//
//  Created by AVINASH on 17/07/26.
//

import SwiftUI

struct AuthHeaderView: View {
    
    let title: String
    let subTitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSize.s8) {
            Text(title).textStyle(theme.typography.h2)
            Text(subTitle).textStyle(theme.typography.bodyBold)
                .foregroundStyle(theme.colors.textSecondary)
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    AuthHeaderView(title: "Welcome Back", subTitle: "Sign in to continue to Chatify").padding()
}
