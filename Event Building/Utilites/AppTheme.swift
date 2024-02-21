//
//  AppTheme.swift
//  Event Building
//
//  Created by elmemy on 21/02/2024.
//

// AppTheme.swift

import SwiftUI

enum TextStyles {
    case title
    case subtitle
    case body
    case bodyWhite
    case black

    var font: Font {
        switch self {
        case .title:
            return Font.custom(AppFonts.avenir, size: 18).weight(.bold)
        case .subtitle:
            return Font.custom(AppFonts.avenir, size: 16).weight(.medium)
        case .body:
            return Font.custom(AppFonts.avenir, size: 14).weight(.regular)
        case .bodyWhite:
            return Font.custom(AppFonts.avenir, size: 14).weight(.regular)
        case .black:
            return Font.custom(AppFonts.avenir, size: 18).weight(.bold)
        }
    }

    var color: Color {
        switch self {
        case .title:
            return AppColors.primary
        case .subtitle:
            return AppColors.secondary
        case .body:
            return AppColors.secondary
        case .bodyWhite:
            return Color.white
        case .black:
            return Color.black
        }
    }
}
