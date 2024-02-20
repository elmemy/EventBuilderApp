//
//  Event Building
//
//  Created by elmemy on 19/02/2024.
//

// View for displaying an event item
import SwiftUI

struct ItemView: View {
    let item: EventItem
    @ObservedObject var viewModel: EventViewModel

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                AsyncImage(url: item.image)

                if viewModel.addedItems.contains(where: { $0.id == item.id }) {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(5)
                } else {
                    Button(action: {
                        viewModel.addItem(item)
                    }) {
                        Image("plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(5)
                    }
                    .disabled(viewModel.addedItems.contains(where: { $0.id == item.id }))
                }
            }

            Text(item.title)
                .font(.custom("Avenir", size: 14))
                .fontWeight(.semibold)
                .foregroundColor(Color(#colorLiteral(red: 0.45490196347236633, green: 0.45490196347236633, blue: 0.45490196347236633, alpha: 1)))
                .lineLimit(1)
                .padding(.bottom, 2.0)

            Text("$ \(String(format: "%.2f", item.minBudget)) - \(String(format: "%.2f", item.maxBudget))")
                .font(.custom("Avenir", size: 14))
                .fontWeight(.bold)
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}
