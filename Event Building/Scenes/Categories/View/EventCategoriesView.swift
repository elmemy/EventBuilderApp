//
//  EventCategoriesView.swift
//  Event Building
//
//  Created by elmemy on 20/02/2024.
//
import SwiftUI

// View for displaying event categories
struct EventCategoriesView: View {
    @ObservedObject var viewModel: CategoriesViewModel
    let gridItems: [GridItem]
    
    
    var body: some View {
        switch viewModel.loaderState {
        case .idle:
            ProgressView(AppLocalizations.localizedString("Loading"))
                .onAppear {
                    Task{
                        await viewModel.fetchCategories()
                    }
                }
        case .loading:
            ProgressView(AppLocalizations.localizedString("Loading"))
        case .loaded:
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach( viewModel.categories!, id: \.id) { category in
                        CategoryItemView(category: category, viewModel: viewModel)
                    }
                }
                .padding(16)
            }
            
        case .error(let error):
            Text("Error: \(error.localizedDescription)")
        }
        
        
    }
}
