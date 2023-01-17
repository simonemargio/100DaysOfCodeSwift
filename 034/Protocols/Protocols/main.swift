//  Created by Simone Margio
//  wwww.simonemargio.im

/*
 The problem is that not all birds can fly (penguins for example).
 Furthermore, the airplane does not unfold its wings but uses its motor to fly in the sky.
 This problem can be solved by using protocols.

 You create a CanFly protocol and assign it to everyone (classes and structures) that can actually fly.
 */

/*
class Bird {
    var isFemale = true
    
    func leyEdd() {
        if isFemale {
            print("A new bird 🥰")
        }
    }
    
    func fly() {
        print("Bird flys")
    }
}

class Eagle: Bird {
    func soar() {
        print("The eagle glides in the air using air currents")
    }
}

class Airplane: Bird {
 
}

class Penguin: Bird {
    func swim() {
        print("Stupid sexy swims penguin")
    }
}

struct FlyingMuseum {
    func flyingDemo(flyingObj: Bird) {
        flyingObj.fly()
    }
}

let myEagle = Eagle()
myEagle.fly()

let myAirplane = Airplane()
myAirplane.fly()

let myPenguin = Penguin()
myPenguin.swim()
myPenguin.leyEdd()

let myMuseum = FlyingMuseum()
myMuseum.flyingDemo(flyingObj: myPenguin)
myMuseum.flyingDemo(flyingObj: myAirplane)
*/

protocol CanFly {
    func fly()
}

class Bird {
    var isFemale = true
    
    func leyEdd() {
        if isFemale {
            print("A new bird 🥰")
        }
    }
}

class Eagle: Bird, CanFly {
    func fly() {
        print("The eagle flys away")
    }
    
    func soar() {
        print("The eagle glides in the air using air currents")
    }
}

struct Airplane: CanFly {
    func fly() {
        print("The airplane stars its engine to fly")
    }
}

class Penguin: Bird {
    func swim() {
        print("Stupid sexy swims penguin")
    }
}

struct FlyingMuseum {
    func flyingDemo(flyingObj: CanFly) {
        flyingObj.fly()
    }
}

let myEagle = Eagle()
let myAirplane = Airplane()
myAirplane.fly()

let myPenguin = Penguin()
myPenguin.swim() // But cannot fly

let myMuseum = FlyingMuseum()

myMuseum.flyingDemo(flyingObj: myAirplane)
myMuseum.flyingDemo(flyingObj: myEagle)
