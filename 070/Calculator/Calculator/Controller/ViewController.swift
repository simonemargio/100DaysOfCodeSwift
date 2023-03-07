//
//  ViewController.swift
//  Calculator
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    // Check if users finishes to type
    // Make the variable private. It can only accessible in this class
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        // Get the current display number
        get {
            // Take display number and convert into double
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label to a double.")
            }
            return number
        }
        // Set the displayValue value into displayLabel
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
       
        if let calcMethod = sender.currentTitle {
            // Set the current diplayValue
            let calculator = CalculatorLogic(number: displayValue)
            // Make the calculation
            displayValue = calculator.calculate(symbol: calcMethod)
            // Shw result
            displayLabel.text = String(displayValue)
        }
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                // Show first number
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    // Round the displayValue (es: 8.1 -> 8) and compare it
                    // with displayValue (8 == 8.1) -> isInt = false
                    // With this we can check if there's an integer or pointer number
                    // in displayValue
                    // (es: 5 -> 5) -> (5 == 5) -> isInt = true
                    let isInt = floor(displayValue) == displayValue
                    
                    // The number isn't an integer
                    // So, return and don't execute
                    // next instruction
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    } // End numButtonPressed

    
  
}


/*
My first solution to check how many "." there're in currentDisplayValue
if (displayLabel.text!.components(separatedBy: ".")).count <= 1 || numValue != "."{
    // Append by second number
    displayLabel.text = displayLabel.text! + numValue
}*/
