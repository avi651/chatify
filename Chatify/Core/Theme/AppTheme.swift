//
//  AppTheme.swift
//  Chatify
//
//  Created by AVINASH on 17/07/26.
//

import Foundation

struct AppTheme {

    // MARK: - Colors

    let colors: AppColorsInterface

    // MARK: - Typography

    let typography: AppTypographyInterface

    // MARK: - Initializer

    init(
        colors: AppColorsInterface = AppColors.current,
        typography: AppTypographyInterface = AppTypography()
    ) {
        self.colors = colors
        self.typography = typography
    }
}

// MARK: - Global Theme

let theme = AppTheme()
