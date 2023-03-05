//
//  Created by Simone Margio
//  www.simonemargio.im
//


import UIKit

//let pizzaInInches: Int = 16

// We can trigger a property when its value change
// For example we can keep an eye on the variable pizzaInInches and check
// that it does not have a senseless value (like 33)
// To do that we can create an observed property
var pizzaInInches: Int = 16 {
    // willSet and didSet are equivalent and monitor the change of the variable
    // willSet is executed BEFORE the variable value changes
    // didSet is executed AFTER the value of the variable changes
    willSet {
        // With willSet we can use the value
        print(newValue)
    }
    didSet {
        // With didSet we can use the old value
        print(oldValue)
        
        // Check if the value is correct
        if pizzaInInches > 20 {
            print("Invalid size specified, max is 20")
        }
    }
}

pizzaInInches = 8
// This print:
// 8  <- willSet newValue
// 16 <- didSet oldValue
