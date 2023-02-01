import UIKit

// Loops for everyone

//Array
let fruits = ["Apple", "Kiwi", "Orange"]
let fruitsAgain: Set = ["Apple", "Kiwi", "Orange"] // Set = more efficient

// Dictionary
let contact = ["Simon": 12131, "Steve": 1121312, "Melany": 0992]

// Simple variable
let word = "ohwowsomuchwords"

// Range
let halfOpenRange = 1..<5
let closedRange = 1...5


for fruit in fruits {
    print(fruit)
}

print("\n\n")

for fruit in fruitsAgain {
    print(fruit)
}

print("\n\n")

for singleElement in contact {
    print("Person: \(singleElement.key) Contact: \(singleElement.value)")
}

print("\n\n")

for letter in word {
    print(letter)
}

print("\n\n")

for number in halfOpenRange {
    print(number)
}

print("\n\n")

for number in closedRange {
    print(number)
}

print("\n\n")

// Loop without variable to print
for _ in closedRange {
    print("Hey!")
}


print("\nWhile loops\n")

var count = 3

while count != 0 {
    print(count)
    count -= 1
}

print("\n\n")

while count < 10 {
    print(count)
    count += 1
}
