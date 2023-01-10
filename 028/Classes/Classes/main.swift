//
//  main.swift
//  Classes
//
//  Created by Simone Margio.
//  www.simonemargio.im
//

// Define a class colled enemy call its methos
let enemy = Enemy(helth: 10, attackStrenght: 10)
enemy.move()
enemy.attack()
print("Enemy: \(enemy.health) - \(enemy.attackStrength)\n\n")

// Define another same class enemy2 with own health and attack
let enemy2 = Enemy(helth: 6, attackStrenght: 8)
enemy2.health = 7
enemy2.attackStrength = 2
enemy2.move()
print("Enemy2: \(enemy2.health) - \(enemy2.attackStrength)\n\n")

// Dragon class with its method talk
let dragon = Dragon(helth: 40, attackStrenght: 0)
dragon.wingSpan = 5
dragon.attackStrength = 50
dragon.talk(speech: "sup bro!")

// See Dragon's class
dragon.move()
dragon.attack()
