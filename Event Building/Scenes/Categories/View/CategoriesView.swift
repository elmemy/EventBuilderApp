//
//  Event Building
//
//  Created by elmemy on 19/02/2024.
//
// ContentView.swift
import SwiftUI

struct CategoriesView: View {
    @StateObject private var viewModel = CategoriesViewModel(categoriesService: CategoriesService(networkService: NetworkService()))
    
    
    let gridItems = [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                EventTitleView()
                
                EventDescriptionView()
                
                
                Spacer().frame(height: 39)
                
                EventCategoriesView(viewModel: viewModel, gridItems: gridItems)
                Spacer()
                
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
