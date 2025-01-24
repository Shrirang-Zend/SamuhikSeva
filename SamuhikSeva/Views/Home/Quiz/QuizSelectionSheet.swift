//
//  QuizSelectionSheet.swift
//  SamuhikSeva
//
//  Created by Shrirang Zend on 23/01/25.
//

import SwiftUI

struct QuizSelectionSheet: View {
    @Binding var isQuizDetailPresented: Bool
    @EnvironmentObject var viewModel: QuizViewModel

    var body: some View {
        NavigationView {
            VStack {
                Text("Select a Quiz")
                    .font(.title)
                    .padding()

                List(viewModel.quizzes, id: \.id) { quiz in
                    NavigationLink(
                        destination: QuizDetailView(
                            viewModel: QuizDetailViewModel(quiz: quiz)
                        )
                    ) {
                        Text(quiz.theme)
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarHidden(true)
        }
    }
}

struct QuizSelectionSheet_Previews: PreviewProvider {
    static var previews: some View {
        QuizSelectionSheet(isQuizDetailPresented: .constant(false)) // Provide dummy binding
            .environmentObject(QuizViewModel()) // Inject environment object
            .previewLayout(.device)
    }
}
