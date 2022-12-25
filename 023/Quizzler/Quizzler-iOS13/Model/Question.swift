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
    let answare: String
    
    init(q: String, a: String){
        self.text = q
        self.answare = a
    }
}
