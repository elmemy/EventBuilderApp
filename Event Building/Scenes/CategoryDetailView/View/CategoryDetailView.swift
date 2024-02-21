//
//  Event Building
//
//  Created by elmemy on 19/02/2024.
//

// View for displaying details of a specific category

import SwiftUI

struct CategoryDetailView: View {
    @ObservedObject var viewModel: EventViewModel
    let category: CategoryModel
    @State private var displayedAverageCost: String = "0.00 - 0.00"

    let gridColumns = [GridItem(.flexible()), GridItem(.flexible())]
    let gridSpacing: CGFloat = 16.0

    var body: some View {
        VStack(spacing: 0) {
            Text(AppLocalizations.localizedString("EventBuilder"))
                .font(TextStyles.title.font)
                .multilineTextAlignment(.center)
                .foregroundColor(TextStyles.title.color)

            Text(AppLocalizations.localizedString("AddItemsMessage"))
                .font(TextStyles.subtitle.font)
                .multilineTextAlignment(.center)
                .padding(.top, 16)
                .foregroundColor(TextStyles.subtitle.color)

            Text(displayedAverageCost)
                .font(TextStyles.body.font)
                .fontWeight(.bold)
                .lineSpacing(51)
                .kerning(0)
                .multilineTextAlignment(.center)
                .foregroundColor(TextStyles.body.color)
                .onReceive(viewModel.$averageCost) { newAverageCost in
                    displayedAverageCost = newAverageCost
                }

            Spacer().frame(height: 39)

            ScrollView {
                LazyVGrid(columns: gridColumns, spacing: gridSpacing) {
                    ForEach(viewModel.items, id: \.title) { item in
                        ItemView(item: item, viewModel: viewModel)
                    }
                }
                .padding(16)
            }

            Spacer()

            NavigationLink(destination: ResultView(viewModel: viewModel)) {
                CustomButton(title: AppLocalizations.localizedString("Save"))
            }
            .onAppear {
                Task {
                    await viewModel.fetchItems(for: category)
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchCategories()
            }
        }
    }
}
