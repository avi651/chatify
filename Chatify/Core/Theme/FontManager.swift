//
//  FontManager.swift
//  Chatify
//
//  Created by AVINASH on 17/07/26.
//


//
//  FontManager.swift
//  Chatify
//
//  Created by AVINASH on 17/07/26.
//

import SwiftUI

enum FontManager {

    // MARK: - Font Names

    private static let regularName = "Poppins-Regular"
    private static let mediumName = "Poppins-Medium"
    private static let semiBoldName = "Poppins-SemiBold"
    private static let boldName = "Poppins-Bold"

    // MARK: - Fonts

    static func regular(size: CGFloat) -> Font {
        .custom(regularName, size: size)
    }

    static func medium(size: CGFloat) -> Font {
        .custom(mediumName, size: size)
    }

    static func semiBold(size: CGFloat) -> Font {
        .custom(semiBoldName, size: size)
    }

    static func bold(size: CGFloat) -> Font {
        .custom(boldName, size: size)
    }
}
