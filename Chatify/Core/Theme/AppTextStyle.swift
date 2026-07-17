//
//  AppTextStyle.swift
//  Chatify
//
//  Created by AVINASH on 17/07/26.
//

import SwiftUI

struct AppTextStyle {

    // MARK: - Properties

    let font: Font

    let color: Color

    let lineSpacing: CGFloat

    let letterSpacing: CGFloat

    // MARK: - Initializer

    init(
        font: Font,
        color: Color,
        lineSpacing: CGFloat = 0,
        letterSpacing: CGFloat = 0
    ) {
        self.font = font
        self.color = color
        self.lineSpacing = lineSpacing
        self.letterSpacing = letterSpacing
    }
}
