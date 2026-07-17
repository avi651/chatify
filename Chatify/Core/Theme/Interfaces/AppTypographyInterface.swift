//
//  AppTypographyInterface.swift
//  Chatify
//
//  Created by AVINASH on 17/07/26.
//

import Foundation

protocol AppTypographyInterface {

    // MARK: - Headings

    var h1: AppTextStyle { get }

    var h2: AppTextStyle { get }

    var h3: AppTextStyle { get }

    var h4: AppTextStyle { get }

    // MARK: - Body

    var body: AppTextStyle { get }

    var bodyWhite: AppTextStyle { get }

    var bodyBold: AppTextStyle { get }

    var bodyItalic: AppTextStyle { get }

    var bodyBoldItalic: AppTextStyle { get }

    // MARK: - Small

    var small: AppTextStyle { get }

    var smallBold: AppTextStyle { get }

    // MARK: - Mini

    var mini: AppTextStyle { get }
}
