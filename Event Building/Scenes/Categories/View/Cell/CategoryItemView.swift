//
//  Event Building
//
//  Created by elmemy on 19/02/2024.
//
import SwiftUI

// View for displaying a category item
struct CategoryItemView: View  {
    let category: CategoryModel
    var viewModel: CategoriesViewModel

    var body: some View {
        NavigationLink(destination: CategoryDetailView(category: category)) {
            VStack(alignment: .leading) {
                AsyncImage(url: category.image)
                
                HStack {
                    Text(category.title)
                        .font(.custom(AppFonts.avenir, size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(#colorLiteral(red: 0.45490196347236633, green: 0.45490196347236633, blue: 0.45490196347236633, alpha: 1)))
                        .lineLimit(1)
                        .multilineTextAlignment(.leading)
                        .padding(8)
                    
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color(#colorLiteral(red: 0.36470588235294116, green: 0.6392156862745098, blue: 0.6627450980392157, alpha: 1)))
                        .font(.system(size: 14))
                        .padding(8)
                }
            }
            .background(Color.white)
            .cornerRadius(10.0)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        }
    }
}
