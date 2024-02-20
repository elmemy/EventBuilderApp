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
            Text("Event Builder")
                .customTextStyle(size: 18, weight: .bold)
                .multilineTextAlignment(.center)

            Text("Add items to your event to view our cost estimate.")
                .customTextStyle(size: 16, weight: .medium)
                .multilineTextAlignment(.center)
                .padding(.top, 16)
                .foregroundColor(Color(#colorLiteral(red: 0.45490196347236633, green: 0.45490196347236633, blue: 0.45490196347236633, alpha: 1)))

            Text(displayedAverageCost)
                .font(.custom("Avenir", size: 37))
                .fontWeight(.bold)
                .lineSpacing(51)
                .kerning(0)
                .multilineTextAlignment(.center)
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
                CustomButton(title: "Save")
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
