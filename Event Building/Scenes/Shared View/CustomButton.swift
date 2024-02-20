//
//  CustomButton.swift
//  Event Building
//
//  Created by elmemy on 20/02/2024.
//

import SwiftUI

// View for a custom-styled button
struct CustomButton: View {
    var title: String

    var body: some View {
        Text(title)
            .foregroundColor(.white)
            .frame(width: 343, height: 47)
            .background(AppColors.primary)
            .cornerRadius(5)
    }
}
