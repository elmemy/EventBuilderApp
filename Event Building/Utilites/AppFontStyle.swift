//
//  AppFontStyle.swift
//  Event Building
//
//  Created by elmemy on 20/02/2024.
//

// FontStyle.swift

import SwiftUI

struct AppFonts {
    static let avenir = "Avenir"
}

extension Font {
    static func customFont(_ size: CGFloat, weight: Font.Weight) -> Font {
        return Font.custom(AppFonts.avenir, size: size).weight(weight)
    }
}
