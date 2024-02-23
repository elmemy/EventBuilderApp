//
//  Event Building
//
//  Created by elmemy on 19/02/2024.
//

// View for displaying details of a specific category
import SwiftUI

struct CategoryDetailView : View {
        
    @StateObject private var viewModel = CategoryDetailViewModel(itemsService: ItemsService(networkService: NetworkService()))

    let category: CategoryModel
        
    // Define gridColumns and gridSpacing
    let gridColumns = [GridItem(.flexible()), GridItem(.flexible())]
    let gridSpacing: CGFloat = 16.0
    
    // Body
    var body: some View {
        VStack(spacing: 0) {
            // Display EventTitleView
            EventTitleView()
            
            // Display EventDescriptionView
            EventDescriptionView()
            
            // Display Average Cost
            Text(viewModel.averageCost)
                .font(TextStyles.body.font)
                .fontWeight(.bold)
                .lineSpacing(51)
                .kerning(0)
                .multilineTextAlignment(.center)
                .foregroundColor(TextStyles.body.color)
            
            // Display items based on loaderState
            Spacer()
            switch viewModel.loaderState {
            case .idle:
                ProgressView(AppLocalizations.localizedString("Loading"))
                    .onAppear {
                        Task {
                            await viewModel.fetchItems(for: category)
                        }
                    }
            case .loading:
                ProgressView(AppLocalizations.localizedString("Loading"))
            case .loaded:
                ScrollView {
                    LazyVGrid(columns: gridColumns, spacing: gridSpacing) {
                        ForEach(viewModel.items, id: \.title) { item in
                            ItemView(item: item, viewModel: viewModel)
                        }
                    }
                    .padding(16)
                }
            case .error(let error):
                Text("Error: \(error.localizedDescription)")
            }
            
            Spacer()

            // NavigationLink to ResultView
            NavigationLink(destination: ResultView(displayedAverageCost: viewModel.averageCost)) {
                CustomButton(title: AppLocalizations.localizedString("Save"))
            }
            .onAppear {
                Task {
                    await viewModel.fetchItems(for: category)
                }
            }
        }
    }
}
