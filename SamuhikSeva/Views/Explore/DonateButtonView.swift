//
//  DonateButtonView.swift
//  SamuhikSeva
//
//  Created by Shrirang Zend on 24/01/25.
//

import SwiftUI

struct DonateButtonView: View {
    @Binding var isDonationSheetPresented: Bool
    @Binding var showConfetti: Bool
    let project: Project

    var body: some View {
        Button(action: {
            isDonationSheetPresented = true
        }) {
            Text("Donate")
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .sheet(isPresented: $isDonationSheetPresented) {
            DonationView(isPresented: $isDonationSheetPresented, onDonate: {
                withAnimation {
                    showConfetti = true // Trigger confetti
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    showConfetti = false // Dismiss confetti after 2 seconds
                }
            })
            .presentationDetents([.medium, .large])
            .presentationDragIndicator(.visible)
        }
    }
}
