//
//  Event Building
//
//  Created by elmemy on 19/02/2024.
//

// View for displaying an event item

import SwiftUI

struct ItemView<ViewModel: CategoryDetailViewModelProtocol>: View {
    let item: EventItem
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                AsyncImage(url: item.image)

                if viewModel.addedItems.contains(where: { $0.id == item.id }) {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(5)
                        .foregroundColor(TextStyles.title.color)
                } else {
                    Button(action: {
                        viewModel.addItem(item)
                    }) {
                        Image("plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(5)
                            .foregroundColor(TextStyles.title.color)
                    }
                    .disabled(viewModel.addedItems.contains(where: { $0.id == item.id }))
                }
            }

            Text(item.title)
                .font(TextStyles.subtitle.font)
                .foregroundColor(TextStyles.subtitle.color)
                .lineLimit(1)
                .padding(.bottom, 2.0)

            Text("$ \(String(format: "%.2f", item.minBudget)) - \(String(format: "%.2f", item.maxBudget))")
                .font(TextStyles.body.font)
                .fontWeight(.bold)
                .foregroundColor(TextStyles.body.color)
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}
