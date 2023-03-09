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
struct CalculatorLogic {
    // Make number only accessible by Calculator Logic
    private var number: Double?
    // Tuple with the first number and the symbol +,-,/ etc
    private var intermediateCalculation: (n1: Double, calcMethod: String)?

    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
               return performTwoNumCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("Invalid operation")
            }
        }
        return nil
    }

    
}
