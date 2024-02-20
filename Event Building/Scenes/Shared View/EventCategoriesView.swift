//
//  EventCategoriesView.swift
//  Event Building
//
//  Created by elmemy on 20/02/2024.
//

import SwiftUI
// View for displaying event categories
struct EventCategoriesView: View {
    @ObservedObject var viewModel: EventViewModel
    let gridItems: [GridItem]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems, spacing: 16) {
                ForEach(viewModel.categories, id: \.title) { category in
                    CategoryItemView(category: category)
                }
            }
            .padding(16)
        }
    }
}

