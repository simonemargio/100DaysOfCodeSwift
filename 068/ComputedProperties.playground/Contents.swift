//
//  Created by Simone Margio
//  www.simonemargio.im
//

import Foundation

// We have 6 slices of 10 inches pizza
let pizzaInInches: Int = 10
var numberOdSlices: Int = 6

print(numberOdSlices)

// Now if I buy a 14 inch pizza I want that numberOdSlices automatically updated to 10
// let pizzaInInches: Int = 10
// var numberOdSlices: Int = 6
//
// let pizzaInInches: Int = 14
// var numberOdSlices: Int = 10
// We use computed properties


/* GETTER */

let pizzaInInches: Int = 14
var numberOdSlices: Int {
    // The new value return into numberOdSlices variable
    // This's a Getter: we get the numberOdSlices's value
    return pizzaInInches - 4
    // Or we can write
    // get{
    //  return pizzaInInches - 4
    // }
}


print(numberOdSlices)



/* SETTER */

let pizzaInInches: Int = 14
var numberOdSlices: Int {
    get {
        return pizzaInInches - 4
    }
    // Set is executed when the numberOdSlices variable gets a value
    set {
        // newValue is a variable created when using set, it contains the value of the variable
        print("numberOdSlices now has a new value which is \(newValue)")
    }

}

numberOdSlices = 12


/* COMPUTED PROPERTIES */

let pizzaInInches: Int = 12
let numberOfPeople: Int = 6
let slicesPerPerson: Int = 5


var numberOdSlices: Int {
    get{
        return pizzaInInches - 4
    }
}

// Based on above variables we want to create
// a computed property called that calculed how
// many pizza we should buy

var numberOfPizza: Int {
    get {
        let numberOfPeopleFedPerPizza = numberOdSlices / slicesPerPerson
        return numberOfPeople / numberOfPeopleFedPerPizza
    }
}

print(numberOfPizza)
