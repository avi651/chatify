//
//  AppFont.swift
//  Chatify
//
//  Created by AVINASH on 14/07/26.
//

import SwiftUI

enum AppFont {

    static let title = Font.system(
        size: AdaptiveLayout.value(
            small: 28,
            medium: 34,
            large: 40
        ),
        weight: .bold
    )

    static let heading = Font.system(
        size: AdaptiveLayout.value(
            small: 20,
            medium: 24,
            large: 28
        ),
        weight: .semibold
    )

    static let body = Font.system(
        size: AdaptiveLayout.value(
            small: 14,
            medium: 16,
            large: 18
        )
    )

    static let caption = Font.system(
        size: AdaptiveLayout.value(
            small: 12,
            medium: 14,
            large: 16
        )
    )
}
