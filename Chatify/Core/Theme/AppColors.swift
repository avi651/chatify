//
//  AppColors.swift
//  Chatify
//
//  Created by AVINASH on 17/07/26.
//


import SwiftUI

struct AppColors: AppColorsInterface {

    // MARK: - Shared Instance

    static let current = AppColors()

    // MARK: - Color Palettes

    let primary = AppColorPalette(
        v0: Color(hex: "#F5F9FF"),
        v10: Color(hex: "#DCEBFF"),
        v20: Color(hex: "#B8D6FF"),
        v30: Color(hex: "#94C1FF"),
        v40: Color(hex: "#6FABFF"),
        v50: Color(hex: "#4B96FF"),
        v60: Color(hex: "#267FFF"),
        v70: Color(hex: "#0069FF"),
        v80: Color(hex: "#0052C7"),
        v90: Color(hex: "#003B8F"),
        v100: Color(hex: "#002457")
    )

    let neutral = AppColorPalette(
        v0: Color(hex: "#FFFFFF"),
        v10: Color(hex: "#F8F9FA"),
        v20: Color(hex: "#F1F3F5"),
        v30: Color(hex: "#E9ECEF"),
        v40: Color(hex: "#DEE2E6"),
        v50: Color(hex: "#CED4DA"),
        v60: Color(hex: "#ADB5BD"),
        v70: Color(hex: "#6C757D"),
        v80: Color(hex: "#495057"),
        v90: Color(hex: "#343A40"),
        v100: Color(hex: "#212529")
    )

    let success = AppColorPalette(
        v0: Color(hex: "#F1FFF5"),
        v10: Color(hex: "#D3F9D8"),
        v20: Color(hex: "#B2F2BB"),
        v30: Color(hex: "#8CE99A"),
        v40: Color(hex: "#69DB7C"),
        v50: Color(hex: "#51CF66"),
        v60: Color(hex: "#40C057"),
        v70: Color(hex: "#37B24D"),
        v80: Color(hex: "#2F9E44"),
        v90: Color(hex: "#2B8A3E"),
        v100: Color(hex: "#237804")
    )

    let warning = AppColorPalette(
        v0: Color(hex: "#FFF9DB"),
        v10: Color(hex: "#FFF3BF"),
        v20: Color(hex: "#FFEC99"),
        v30: Color(hex: "#FFE066"),
        v40: Color(hex: "#FFD43B"),
        v50: Color(hex: "#FCC419"),
        v60: Color(hex: "#FAB005"),
        v70: Color(hex: "#F59F00"),
        v80: Color(hex: "#F08C00"),
        v90: Color(hex: "#E67700"),
        v100: Color(hex: "#D9480F")
    )

    let error = AppColorPalette(
        v0: Color(hex: "#FFF5F5"),
        v10: Color(hex: "#FFE3E3"),
        v20: Color(hex: "#FFC9C9"),
        v30: Color(hex: "#FFA8A8"),
        v40: Color(hex: "#FF8787"),
        v50: Color(hex: "#FF6B6B"),
        v60: Color(hex: "#FA5252"),
        v70: Color(hex: "#F03E3E"),
        v80: Color(hex: "#E03131"),
        v90: Color(hex: "#C92A2A"),
        v100: Color(hex: "#A51111")
    )

    // MARK: - Semantic Colors

    var background: Color {
        neutral.v0
    }

    var surface: Color {
        neutral.v10
    }

    var textPrimary: Color {
        neutral.v100
    }

    var textSecondary: Color {
        neutral.v70
    }

    var textDisabled: Color {
        neutral.v50
    }

    var border: Color {
        neutral.v30
    }

    var divider: Color {
        neutral.v20
    }

    var info: Color {
        primary.v60
    }

    var white: Color {
        .white
    }

    var black: Color {
        .black
    }

    var clear: Color {
        .clear
    }
}
