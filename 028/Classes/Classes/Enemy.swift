//
//  Enemy.swift
//  Classes
//
//  Created by Simone Margio.
//  www.simonemargio.im
//

class Enemy {
    var health: Int
    var attackStrength: Int
    
    init(helth: Int, attackStrenght: Int){
        self.health = helth
        self.attackStrength = attackStrenght
    }
    
    func move() {
        print("Walk")
    }
    
    func attack() {
        print("Land a hit, does \(attackStrength) damage!")
    }
}


