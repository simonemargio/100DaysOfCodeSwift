//
//  CalculateBrain.swift
//  BMI Calculator
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    mutating func calculateBMI(h: Float, w: Float) {
        let bmiValue = w / (h * h)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies 🍰" , color: .systemBlue)
        } else if bmiValue > 24.9 {
            bmi = BMI(value: bmiValue, advice: "OH NO! 😞", color: .systemRed)
        } else {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle 🥰", color: .systemGreen)
        }
    }
    
    func getBMI() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
        
    func getBMIAdvice () -> String {
        return bmi?.advice ?? "Error"
    }
    
    func getBMIColor() -> UIColor {
        return bmi?.color ?? .blue
    }
}

