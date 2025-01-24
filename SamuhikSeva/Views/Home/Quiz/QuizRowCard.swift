//
//  QuizRowCard.swift
//  SamuhikSeva
//
//  Created by Shrirang Zend on 23/01/25.
//

import SwiftUI

struct QuizRowCard: View {
    let option: String
    let isCorrect: Bool
    @Binding var selectedAnswer: String?

    var body: some View {
        Button(action: {
            selectedAnswer = option
        }) {
            HStack {
                Text(option)
                    .font(.body)
                Spacer()
                if selectedAnswer == option {
                    Image(systemName: isCorrect ? "checkmark.circle" : "xmark.circle")
                        .foregroundColor(isCorrect ? .green : .red)
                }
            }
            .padding()
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(
                        selectedAnswer == option
                            ? (isCorrect ? Color.green : Color.red)
                            : Color.gray,
                        lineWidth: 2
                    )
            )
        }
        .disabled(selectedAnswer != nil) // Disable after selection
    }
}

struct QuizRowCard_Previews: PreviewProvider {
    static var previews: some View {
        QuizRowCard(
            option: "Plastic bottles",
            isCorrect: true,
            selectedAnswer: .constant(nil)
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
