import UIKit


func fibonacci(n: Int) {
    var index = 2
    var first = 0
    var second = 1
    var third = 0
    
    print(first)
    print(second)
    
    while index != n {
        index += 1
        third = first + second
        first = second
        second = third
        
        print(third)
    }
    print("\n")
}


fibonacci(n: 5)
fibonacci(n: 10)
