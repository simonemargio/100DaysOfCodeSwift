//
//  Dragon.swift
//  Classes
//
//  Created by Simone Margio.
//  www.simonemargio.im
//

// The class Dragon is a subclass of Enemy and inheritance all its property and methods
class Dragon: Enemy {
    var wingSpan = 2
    
    func talk(speech: String) {
        print("Says: \(speech)")
    }
    
    // Dragon specify its own methos based on Enemy methods
    override func move() {
        print("Fly")
    }
    
    override func attack() {
        // Call attack method of enemy
        super.attack()
        
        print("Spits fire, does 15 damage!")
    }
}
