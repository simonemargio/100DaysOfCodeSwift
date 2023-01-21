//  Created by Simone Margio
//  www.simonemargio.im

import UIKit

/* Before
func addOne(n: Int) -> Int {
    return n + 1
}

var array = [2,4,6,7,1,0]

print(array.map(addOne))
*/


/* Using closures
print(array.map({ (n: Int) in
    return n + 1
}))
*/

// After
var array = [2,4,6,7,1,0]

print(array.map({ $0 + 1 }))
