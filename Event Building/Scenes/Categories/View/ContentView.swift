//
//  Event Building
//
//  Created by elmemy on 19/02/2024.
//
// ContentView.swift

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = EventViewModel(eventService: EventService(networking: NetworkService()))
    let gridItems = [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)]

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Spacer()

                Text("EventBuilder")
                    .font(TextStyles.title.font)
                    .foregroundColor(TextStyles.subtitle.color)
                    .multilineTextAlignment(.center)

                Text("AddItemsMessage")
                    .font(TextStyles.subtitle.font)
                    .foregroundColor(TextStyles.subtitle.color)
                    .multilineTextAlignment(.center)
                    .padding(.top, 16)

                Spacer().frame(height: 39)

                EventCategoriesView(viewModel: viewModel, gridItems: gridItems)
            }
            .onAppear {
                Task {
                    await viewModel.fetchCategories()
                }
            }
            .background(AppColors.themeBackground)
        }
    }
}
