//
//  Event Building
//
//  Created by elmemy on 19/02/2024.
//

// View for the main content
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = EventViewModel()
    let gridItems = [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)]

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Spacer()

                EventTitleView()

                EventDescriptionView()

                Spacer().frame(height: 39)

                EventCategoriesView(viewModel: viewModel, gridItems: gridItems)
                

            }
            .onAppear {
                Task {
                    await viewModel.fetchCategories()
                }
            }
        }
    }
}

// View for displaying the event title
struct EventTitleView: View {
    var body: some View {
        Text("Event Builder")
            .customTextStyle(size: 18, weight: .bold)
            .multilineTextAlignment(.center)
            .padding(.top, 62)
    }
}

// View for displaying the event description
struct EventDescriptionView: View {
    var body: some View {
        Text("Add to your event to view our cost estimate.")
            .customTextStyle(size: 16, weight: .medium)
            .multilineTextAlignment(.center)
            .padding(.vertical, 16)
            .foregroundColor(Color(#colorLiteral(red: 0.45490196347236633, green: 0.45490196347236633, blue: 0.45490196347236633, alpha: 1)))
    }
}

// View for displaying event categories
struct EventCategoriesView: View {
    @ObservedObject var viewModel: EventViewModel
    let gridItems: [GridItem]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems, spacing: 16) {
                ForEach(viewModel.categories, id: \.title) { category in
                    NavigationLink(destination: CategoryDetailView(viewModel: viewModel, category: category)) {
                        CategoryItemView(category: category)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(16)
        }
    }
}

// View for a custom-styled button
struct CustomButton: View {
    var title: String

    var body: some View {
        Text(title)
            .foregroundColor(.white)
            .frame(width: 343, height: 47)
            .background(Color(#colorLiteral(red: 0.3647058824, green: 0.6392156863, blue: 0.662745098, alpha: 1)))
            .cornerRadius(5)
    }
}

// View extension for custom text styling
extension Text {
    func customTextStyle(size: CGFloat, weight: Font.Weight) -> some View {
        self
            .font(.custom("Avenir", size: size))
            .fontWeight(weight)
    }
}
