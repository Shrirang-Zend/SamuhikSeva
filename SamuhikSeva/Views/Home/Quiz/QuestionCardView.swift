//
//  QuestionCardView.swift
//  SamuhikSeva
//
//  Created by Shrirang Zend on 24/01/25.
//

import SwiftUI

struct QuestionCardView: View {
    let question: QuizQuestion
    let selectedOption: String?
    let onOptionSelect: (String) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(question.question)
                .font(.headline)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 10)

            VStack(spacing: 10) {
                ForEach(question.options, id: \.self) { option in
                    QuizRowCard(
                        option: option,
                        isCorrect: option == question.correctOption,
                        selectedAnswer: .constant(selectedOption)
                    )
                }
            }
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}

struct QuestionCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionCardView(
            question: QuizQuestion(
                id: UUID(),
                question: "What is the primary cause of marine pollution?",
                options: ["Plastic bottles", "Metal cans", "Oil spills", "Fishing nets"],
                correctOption: "Plastic bottles"
            ),
            selectedOption: nil,
            onOptionSelect: { _ in }
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
