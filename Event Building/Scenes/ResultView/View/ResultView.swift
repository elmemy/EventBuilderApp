//
//  ResultView.swift
//  Event Building
//
//  Created by elmemy on 19/02/2024.
//
import SwiftUI

struct ResultView: View {
   var displayedAverageCost: String = "0.00 - 0.00"
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text(AppLocalizations.localizedString("EventSaved"))
                    .font(TextStyles.title.font)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .lineSpacing(25)
                    .kerning(0)
                    .padding(.top, 62)
                    .padding(.bottom, 10)
                    .foregroundColor(TextStyles.title.color)
                
                Text(displayedAverageCost)
                    .font(TextStyles.body.font)
                    .fontWeight(.bold)
                    .lineSpacing(51)
                    .kerning(0)
                    .multilineTextAlignment(.center)
                    .foregroundColor(TextStyles.body.color)
                  
                
                Image(systemName: "star.fill")
                    .font(.system(size: 20))
                    .foregroundColor(TextStyles.title.color)
            }
            .padding()
            .frame(width: 350, height: 350)
            .background(Circle().fill(Color.white))
            .clipShape(Circle())
        }
    }
}
