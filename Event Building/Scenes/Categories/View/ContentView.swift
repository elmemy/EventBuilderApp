//
//  Event Building
//
//  Created by elmemy on 19/02/2024.
//

// View for the main content
import SwiftUI

// View for the main content
struct ContentView: View {
    @StateObject private var viewModel = EventViewModel(eventService: EventService(networking: NetworkService()))
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




