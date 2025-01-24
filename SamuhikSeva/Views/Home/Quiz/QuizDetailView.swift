//
//  QuizDetailView.swift
//  SamuhikSeva
//
//  Created by Shrirang Zend on 23/01/25.
//

import SwiftUI

struct QuizDetailView: View {
    @ObservedObject var viewModel: QuizDetailViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(viewModel.quiz.questions, id: \.id) { question in
                    QuestionCardView(
                        question: question,
                        selectedOption: viewModel.selectedOptions[question.id],
                        onOptionSelect: { selectedOption in
                            viewModel.selectOption(for: question.id, option: selectedOption)
                        }
                    )
                }
                Button(action: {
                    let score = viewModel.calculateScore()
                    print("Your score is \(score)/\(viewModel.quiz.questions.count)")
                }) {
                    Text("Submit Quiz")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .background(Color(UIColor.systemGroupedBackground))
        .navigationTitle(viewModel.quiz.theme)
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct QuizDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleQuiz = Quiz(
            id: UUID(),
            theme: "Sample Quiz",
            questions: [
                QuizQuestion(
                    id: UUID(),
                    question: "What is 2 + 2?",
                    options: ["3", "4", "5"],
                    correctOption: "4"
                ),
                QuizQuestion(
                    id: UUID(),
                    question: "What is the capital of France?",
                    options: ["Berlin", "Madrid", "Paris"],
                    correctOption: "Paris"
                )
            ]
        )
        QuizDetailView(viewModel: QuizDetailViewModel(quiz: sampleQuiz))
            .previewLayout(.device)
    }
}
