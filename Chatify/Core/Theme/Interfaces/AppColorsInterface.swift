//
//  AppColorsInterface.swift
//  Chatify
//
//  Created by AVINASH on 17/07/26.
//

import SwiftUI

protocol AppColorsInterface {

    // MARK: - Color Palettes

    var primary: AppColorPalette { get }

    var neutral: AppColorPalette { get }

    var success: AppColorPalette { get }

    var warning: AppColorPalette { get }

    var error: AppColorPalette { get }

    // MARK: - Semantic Colors

    var background: Color { get }

    var surface: Color { get }

    var textPrimary: Color { get }

    var textSecondary: Color { get }

    var textDisabled: Color { get }

    var border: Color { get }

    var divider: Color { get }

    var info: Color { get }

    var white: Color { get }

    var black: Color { get }

    var clear: Color { get }
}
