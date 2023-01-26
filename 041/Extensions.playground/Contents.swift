import UIKit


// This convert a double to a string
let myDouble = 3.12345
let myRoundedDouble = String(format: "%.1f", myDouble)

print(myRoundedDouble)
// Suppose we want the double with tot decimal digits that is not a string.

// ____________________ //

// We use the default function from doubles
var myDouble = 3.12345
myDouble.round()

print(myDouble)
// However, this function only gives us the first rounded decimal place
// To have how many decimal places we want to create an extension

// ____________________ //


// The "name" of the extension is the type of data we want to extend, in this case Doubles
extension Double {
    // I redefine the round function, "to" is the external parameter, "place" is the internal parameter
    func round(to places: Int) -> Double {
        // Set the number of decimal place
        let precisionNumber =  pow(10, Double(places))
        // Self refers to Double, in this case the number 3.12345
        var n = self
        n = n * precisionNumber
        n.round()
        n = n / precisionNumber
        return n
    }
}


var myDouble = 3.12345
myDouble = myDouble.round(to: 3)

// Print "3.123" with "to: 3" decimal numbers
print(myDouble)

// ____________________ //


/*
 Classes and protocols too!
 
 Example with UIButton class:
 I create a button and then I make it round.
 Suppose we always want to create round buttons and we want to avoid writing these* lines of code every time.
 */
let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
button.backgroundColor = .red

button.layer.cornerRadius = 25 // *
button.clipsToBounds = true    // *


// Create an exension
extension UIButton {
    func makeCircular () {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.width / 2
    }
}

let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
button.backgroundColor = .red
button.makeCircular()
