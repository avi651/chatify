//
//  Text+Theme.swift
//  Chatify
//
//  Created by AVINASH on 17/07/26.
//

import SwiftUI

extension Text {

    func textStyle(_ style: AppTextStyle) -> some View {
        self
            .font(style.font)
            .foregroundStyle(style.color)
            .kerning(style.letterSpacing)
            .lineSpacing(style.lineSpacing)
    }
}
