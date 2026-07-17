//
//  AppTypography.swift
//  Chatify
//
//  Created by AVINASH on 17/07/26.
//

import SwiftUI

struct AppTypography: AppTypographyInterface {

    private let colors = AppColors.current

    // MARK: - Headings

    var h1: AppTextStyle {
        AppTextStyle(
            font: FontManager.bold(size: AppSize.sp32),
            color: colors.textPrimary
        )
    }

    var h2: AppTextStyle {
        AppTextStyle(
            font: FontManager.bold(size: AppSize.sp24),
            color: colors.textPrimary
        )
    }

    var h3: AppTextStyle {
        AppTextStyle(
            font: FontManager.bold(size: AppSize.sp20),
            color: colors.textPrimary
        )
    }

    var h4: AppTextStyle {
        AppTextStyle(
            font: FontManager.bold(size: AppSize.sp18),
            color: colors.textPrimary
        )
    }

    // MARK: - Body

    var body: AppTextStyle {
        AppTextStyle(
            font: FontManager.regular(size: AppSize.sp16),
            color: colors.textPrimary
        )
    }

    var bodyWhite: AppTextStyle {
        AppTextStyle(
            font: FontManager.regular(size: AppSize.sp16),
            color: colors.white
        )
    }

    var bodyBold: AppTextStyle {
        AppTextStyle(
            font: FontManager.bold(size: AppSize.sp16),
            color: colors.textPrimary
        )
    }

    var bodyItalic: AppTextStyle {
        AppTextStyle(
            font: FontManager.regular(size: AppSize.sp16),
            color: colors.textPrimary
        )
    }

    var bodyBoldItalic: AppTextStyle {
        AppTextStyle(
            font: FontManager.bold(size: AppSize.sp16),
            color: colors.textPrimary
        )
    }

    // MARK: - Small

    var small: AppTextStyle {
        AppTextStyle(
            font: FontManager.regular(size: AppSize.sp14),
            color: colors.textPrimary
        )
    }

    var smallBold: AppTextStyle {
        AppTextStyle(
            font: FontManager.semiBold(size: AppSize.sp14),
            color: colors.textPrimary
        )
    }

    // MARK: - Mini

    var mini: AppTextStyle {
        AppTextStyle(
            font: FontManager.regular(size: AppSize.sp12),
            color: colors.textPrimary
        )
    }
}
