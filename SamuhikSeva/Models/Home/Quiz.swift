//
//  Quiz.swift
//  SamuhikSeva
//
//  Created by Shrirang Zend on 23/01/25.
//
import Foundation

struct Quiz: Identifiable, Codable {
    var id = UUID()
    let theme: String
    let questions: [QuizQuestion]
}

struct QuizQuestion: Identifiable, Codable {
    var id = UUID()
    let question: String
    let options: [String]
    let correctOption: String
}
