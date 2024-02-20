//
//  EventTitleView.swift
//  Event Building
//
//  Created by elmemy on 20/02/2024.
//

import SwiftUI
// View for displaying the event title
struct EventTitleView: View {
    var body: some View {
        Text(AppLocalizations.localizedString("EventBuilder"))
            .customTextStyle(size: 18, weight: .bold)
            .multilineTextAlignment(.center)
            .padding(.top, 62)
    }
}
