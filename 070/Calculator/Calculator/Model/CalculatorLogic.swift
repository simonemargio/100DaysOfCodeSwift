//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import Foundation

// To calculate the result based on the button the user presses
// The current value on the display is saved and then it can be calculated
class CalculatorLogic {
    
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double {
        
        switch symbol {
        case "+/-":
            return number * -1
        case "AC":
            return 0
        case "%":
            return number * 0.01
        default:
            fatalError("Invalid condition")
        }
    }
    
}
