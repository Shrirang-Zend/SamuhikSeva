//
//  DonationView.swift
//  SamuhikSeva
//
//  Created by Shrirang Zend on 24/01/25.
//

import SwiftUI

struct DonationView: View {
    @Binding var isPresented: Bool
    var onDonate: () -> Void // Closure for triggering confetti

    @State private var donationAmount: String = ""
    @State private var donationMessage: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Make a Donation")
                .font(.title)
                .fontWeight(.bold)

            TextField("Enter amount (₹)", text: $donationAmount)
                .keyboardType(.decimalPad)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.green, lineWidth: 1)
                )
                .padding(.horizontal)

            TextEditor(text: $donationMessage)
                .frame(height: 100)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.horizontal)

            Button(action: {
                onDonate() // Trigger the confetti animation
                isPresented = false // Close the sheet
            }) {
                Text("Donate")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
    }
}

struct DonationView_Previews: PreviewProvider {
    static var previews: some View {
        DonationView(
            isPresented: .constant(true),
            onDonate: {
                print("Donation submitted!")
            }
        )
        .previewLayout(.device)
    }
}
