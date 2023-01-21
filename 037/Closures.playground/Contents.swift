//  Created by Simone Margio
//  www.simonemargio.im

import UIKit

/*
Passing a function as input
func calculator(n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(n1, n2)
}

func add(n1: Int, n2: Int) -> Int {
    return n1 + n2
}

func multiply(n1: Int, n2: Int) -> Int {
    return n1 * n2
}

var total = calculator(n1: 2, n2: 9, operation: add)
print(total)

total = calculator(n1: 4, n2: 5, operation: multiply)
print(total)
 */


/*
Using closures
Normal function
func add(n1: Int, n2: Int) -> Int {
    return n1 * n2
}

Closures function
{ (n1: Int, n2: Int) -> Int in
    return n1 * n2
}
 */

/* Passing closeres funcation as input
func calculator(n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(n1, n2)
}

var total = calculator(n1: 2, n2: 9, operation: { (n1: Int, n2: Int) -> Int in
    return n1 + n2
})

print(total)
*/

/*
 We can make this more readable
 -- --
 var total = calculator(n1: 2, n2: 9, operation: { (n1: Int, n2: Int) -> Int in
     return n1 + n2
 })
 -- --
 var total = calculator(n1: 2, n2: 9, operation: { (n1, n2) -> Int in
     return n1 + n2
 })
 -- --
 var total = calculator(n1: 2, n2: 9, operation: { (n1, n2) in
     return n1 + n2
 })
 -- --
 var total = calculator(n1: 2, n2: 9, operation: { (n1, n2) in n1 + n2 } )
 -- --
 var total = calculator(n1: 2, n2: 9, operation: {$0 * $1} )
 $0 = first parameter
 $1 = second parameter
 -- --
 var total = calculator(n1: 2, n2: 9) {$0 * $1}
 */


func calculator(n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(n1, n2)
}

var total = calculator(n1: 2, n2: 9) {$0 + $1}
print(total)
