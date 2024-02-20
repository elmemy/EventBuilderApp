//
//  ResultView.swift
//  Event Building
//
//  Created by elmemy on 19/02/2024.
//
import SwiftUI

// View for displaying the result of saving an event
struct ResultView: View {
    @ObservedObject var viewModel: EventViewModel
    @State private var displayedAverageCost: String = "0.00 - 0.00"

    var body: some View {
        ZStack {
            Color.gray.opacity(0.1)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Event Saved")
                    .font(.custom("Avenir", size: 20))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .lineSpacing(25)
                    .kerning(0)
                    .padding(.top, 62)
                    .padding(.bottom, 10)

                Text(displayedAverageCost)
                    .font(.custom("Avenir", size: 30))
                    .fontWeight(.bold)
                    .lineSpacing(51)
                    .kerning(0)
                    .multilineTextAlignment(.center)
                    .onReceive(viewModel.$averageCost) { newAverageCost in
                        displayedAverageCost = newAverageCost
                    }

                Image(systemName: "star.fill")
                    .font(.system(size: 20))
            }
            .padding()
            .frame(width: 350, height: 350)
            .background(Circle().fill(Color.white))
            .clipShape(Circle())
        }
    }
}
