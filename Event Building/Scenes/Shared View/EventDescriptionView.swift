//
//  EventDescriptionView.swift
//  Event Building
//
//  Created by elmemy on 20/02/2024.
//

import SwiftUI

// View for displaying the event description
struct EventDescriptionView: View {
    var body: some View {
        Text(AppLocalizations.localizedString("AddItemsMessage"))
            .customTextStyle(size: 16, weight: .medium)
            .multilineTextAlignment(.center)
            .padding(.vertical, 16)
            .foregroundColor(AppColors.secondary)
    }
}
