//
//  File.swift
//  Event Building
//
//  Created by elmemy on 20/02/2024.
//


// View extension for custom text styling
import SwiftUI

extension Text {
    func customTextStyle(size: CGFloat, weight: Font.Weight) -> some View {
        self
            .font(.custom(AppFonts.avenir, size: size))
            .fontWeight(weight)
    }
}
