//
//  Question.swift
//  Quizzler
//
//  Created by Simone Margio.
//  simonemargio.im
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String

    init(q: String, a: [String], correctAnswer: String){
        self.text = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
}
