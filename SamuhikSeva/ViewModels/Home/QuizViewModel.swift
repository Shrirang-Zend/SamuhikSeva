//
//  QuizViewModel.swift
//  SamuhikSeva
//
//  Created by Shrirang Zend on 23/01/25.
//
import Foundation

class QuizViewModel: ObservableObject {
    @Published var quizzes: [Quiz] = []
    @Published var selectedQuiz: Quiz?

    init() {
        loadQuizzes()
    }

    func loadQuizzes() {
        guard let url = Bundle.main.url(forResource: "quiz", withExtension: "json") else {
            print("Quiz JSON file not found!")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode(QuizData.self, from: data)
            quizzes = decodedData.quizzes
            print("Quizzes loaded successfully: \(quizzes)")
        } catch {
            print("Error decoding quiz.json: \(error)")
        }
    }
}

