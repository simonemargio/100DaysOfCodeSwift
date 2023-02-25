import UIKit


// Create a UserDefault variable
// UserDefault is an interface to the user’s defaults database, where we can store key-value
// pairs persistently across launches of ours app.
let defaults = UserDefaults.standard


// Save a float in db by default and give it a "Volume" key to retrieve it
defaults.set(0.66, forKey: "Volume")
// Retrieve into db the value using his key "Volume"
let volume = defaults.float(forKey: "Volume")
print(volume)


// Boolean
defaults.set(true, forKey: "isMusicOn")
// Retrieve
let music = defaults.bool(forKey: "isMusicOn")
print(music)


// String
defaults.set("WoW, so much String", forKey: "funnyString")
// Retrieve
print(defaults.string(forKey: "funnyString")!)


// Date
defaults.set(Date(), forKey: "aDate")
// Retrieve (date is an Obj)
print(defaults.object(forKey: "aDate")!)

// Array
let array = [3,4,5]
defaults.set(array, forKey: "anArray")
// Retrieve (date is an Obj)
print(defaults.array(forKey: "anArray")!)

// Dictionary
let dict = ["Apple": 2, "Kiwi": 5, "Banana": 1]
// Retrieve
defaults.set(dict, forKey: "Dic")
print(defaults.dictionary(forKey: "Dic")!)
