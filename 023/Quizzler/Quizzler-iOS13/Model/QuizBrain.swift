//
//  QuizBrain.swift
//  Quizzler
//
//  Created by Simone Margio.
//  simonemargio.im
//

import Foundation

struct  QuizBrain {
    let quiz = [
        Question(q: "The Java compiler translates Java programs into machine language programs.", a: "False"),
        Question(q: "Pseudocode is a mixture of English and a programming language.", a: "True"),
        Question(q: "Polymorphism is a classification system for organizing classes in Java.", a: "False"),
        Question(q: "The boolean type has only two values.", a: "True"),
        Question(q: "Arithmetic with floating-point numbers is not exact.", a: "True"),
        Question(q: "A common practice that is used in the textbook is to start the names of variables with a capitalletter.", a: "False"),
        Question(q: "This app was made by Simone.", a: "True"),
        Question(q: "Google was originally called 'Backrub'.", a: "True")
    ]
    var currentQuestion = 0
    var score = 0
    
    mutating func checkAnsware(_ userAnsware: String) -> Bool {
        if userAnsware == quiz[currentQuestion].answare {
            score += 1
            return true
        }
        return false
    }
    
    func getQuestionText () -> String {
        return quiz[currentQuestion].text
    }
    
    func getProgress () -> Float {
        return Float(currentQuestion + 1 ) / Float(quiz.count)
    }
    
    mutating func nextQuestion () {
        if (currentQuestion < quiz.count - 1) {
            currentQuestion += 1
        } else {
            currentQuestion = 0
            score = 0
        }
    }
    
    mutating func updateScore () -> Int {
        return score
    }
}
