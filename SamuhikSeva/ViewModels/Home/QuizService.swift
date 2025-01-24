//
//  QuizService.swift
//  SamuhikSeva
//
//  Created by Shrirang Zend on 23/01/25.
//

import Foundation

struct QuizData: Codable {
    let quizzes: [Quiz]
}

struct QuizService {
    func loadQuizzes() -> [Quiz] {
        guard let url = Bundle.main.url(forResource: "quiz", withExtension: "json") else {
            print("Error: quiz.json not found")
            return []
        }

        do {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode(QuizData.self, from: data)
            return decodedData.quizzes
        } catch {
            print("Error decoding quiz.json: \(error)")
            return []
        }
    }
}
