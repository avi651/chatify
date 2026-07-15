//
//  AdaptiveLayout.swift
//  Chatify
//
//  Created by AVINASH on 14/07/26.
//

import UIKit

enum AdaptiveLayout {

    static var isSmall: Bool {
        Screen.width < 375
    }

    static var isMedium: Bool {
        Screen.width >= 375 && Screen.width < 430
    }

    static var isLarge: Bool {
        Screen.width >= 430
    }

    static func value(
        small: CGFloat,
        medium: CGFloat,
        large: CGFloat
    ) -> CGFloat {

        if isSmall { return small }
        if isMedium { return medium }
        return large
    }
}
