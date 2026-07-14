//
//  AppSpacing.swift
//  Chatify
//
//  Created by AVINASH on 14/07/26.
//

import UIKit

enum AppSpacing {

    static let xs = AdaptiveLayout.value(
        small: 4,
        medium: 6,
        large: 8
    )

    static let sm = AdaptiveLayout.value(
        small: 8,
        medium: 10,
        large: 12
    )

    static let md = AdaptiveLayout.value(
        small: 12,
        medium: 16,
        large: 20
    )

    static let lg = AdaptiveLayout.value(
        small: 16,
        medium: 24,
        large: 32
    )

    static let xl = AdaptiveLayout.value(
        small: 24,
        medium: 32,
        large: 40
    )
}
