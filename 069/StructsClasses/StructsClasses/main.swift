//
//  main.swift
//  StructsClasses
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import Foundation


var hero = ClassHero(name: "Iron Man", universe: "Marvel")

var anotherMarvelHero = hero
anotherMarvelHero.name = "The Hulk"

print("Hero name: \(hero.name)")
print("Another Hero name: \(anotherMarvelHero.name)")
// Print:
// Hero name: The Hulk
// Another Hero name: The Hulk
//
// This because classes use a reference type

var structHero = StructHero(name: "Hulk", universe: "Marvel")

var anotherStructHero = structHero
anotherStructHero.name = "Deadpool"

print("Hero name: \(structHero.name)")
print("Another Hero name: \(anotherStructHero.name)")
// Print:
// Hero name: Hulk
// Another Hero name: Deadpool
//
// This because structs use a "copy" value type
