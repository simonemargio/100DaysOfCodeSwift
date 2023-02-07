//
//  Created by Simone Margio
//  www.simonemargio.im
//
//


import UIKit
import Foundation

// Three classes where Human and Fish are subclasses
class Animal {
    var name: String
    
    init(n: String) {
        name = n
    }
}

class Human: Animal {
    func code() {
        print("Typing away...")
    }
}

class Fish: Animal {
    func breatheUnderWater() {
        print("Breathing under water.")
    }
}

// Instantiate all classes
let simone = Human(n: "Simone")
let eliot = Human(n: "Eliot")
let nemo = Fish(n: "Nemo")

// Create an array with these classes
// neighbours array is [Animal] type
// Declaration of neighbours: let neighbours: [Animal]
let neighbours = [simone, eliot, nemo]


/* IS OPERATOR */
print("IS operator")
// Take simone's class
// Declaration of neighboursOne: let neighbourOne: Animal and not Human
let neighbourOne = neighbours[0]

// So If we want check the datatype of neighbours[0]
//  check the datatipe of neighbourOne
if neighbours[0] is Human {
    print("First neighbour is a Human!")
}
//  eliot is Human too
if neighbours[1] is Human {
    print("Second neighbour is a Human!")
}
// nemo isn't a Human
if neighbours[2] is Human {
    print("Third neighbour is a Human!")
}

// So with "is" operator we can check the datatype of one object


/* AS OPERATOR */
print("\nAS operator")
func findNemo(from animals: [Animal]) {
    for animal in animals {
        if animal is Fish {
            print("I found it: \(animal.name)")
         // animal.breatheUnderWater()
         // We can't use this line of code because the variable animal is: let animal: Animal and not Fish
        
         // How we can resolve this?
         // We're using a Downcasting, force Animal class down to Fish class
            let fish = animal as! Fish
         // With "as" we downcast animal variable (that is Animal class) to a Fish class
         // Now we can use the func breatheUnderWater()
            fish.breatheUnderWater()
         }
    }
}
findNemo(from: neighbours)

// So with "as!" operator we can Forced Downcast from a superclass to a subclass
// Attention! If we write: let fish = neighbours[1] as! Fish, this's an error becouse neighbours[1] is Human and not Fish.
// We get a compiler error!

// With as! we FORCE, with as? we can check if there's a downcast
let fish = neighbours[1] as? Fish
// Now fish is an optional: let fish: Fish?
// We can check if fish can use breatheUnderWater()
// Method 1:
fish?.breatheUnderWater()
// Method 2:
if let fish = neighbours[1] as? Fish {
    fish.breatheUnderWater()
} else {
    print("Cast is failed!")
}

func findNemoTwo(from animals: [Animal]) {
    for animal in animals {
        if animal is Fish {
            print("I found it: \(animal.name)")
            let fish = animal as! Fish
            fish.breatheUnderWater()
            // We have done a downcasting from Animal to Fish
            // Let's put things back as they were in the beginning
            // Upcasting from Fish to Animal
            let animalFish = fish as Animal
            // Now animalFish is: let animalFish: Animal and not Fish
         }
    }
}

/*
     SUMMARY
     as! = force downcasting from superclass to subclass
     as? = try to downcasting from superclass to subclass
     as = Upcasting from subclass to superclass
     is = check the datatype
 */


/* ANY OPERATOR */
let num = 4815162342 // Are u L O S T ?

// We can't use this line of code:
//let neighboursTwo = [simone, eliot, nemo, num]

// For fix this making the type of array as:
let neighboursTwo: [Any] = [simone, eliot, nemo, num]

// So with "Any" operator we can mixes classes, structures and data types


class anotherClass {
    var variable = 0
}
let anotherclass = anotherClass()
let neighboursThree: [AnyObject] = [simone, eliot, anotherclass]

// So with "AnyObject" operator we mix any type FROM classes

let number: NSNumber = 11
let word: NSString = "wow"

let neighboursFour: [NSObject] = [number, word]

// So with "NSOBject" operator we mix mix only NS types

/*
     SUMMARY
     Any = mix any type of data
     AnyObject = mix any type FROM classes
     NSOBject = mix only NS types
 */
