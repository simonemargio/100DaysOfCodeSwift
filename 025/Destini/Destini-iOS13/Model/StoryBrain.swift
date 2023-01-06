//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Simone Margio.
//  www.simonemargio.im
//

import Foundation

struct StoryBrain {
    let storyBrain = [
        Story(t: "You wake up in a house that never seen before. There are two doors, one left and one right. Where do you go?", c1: "Left", c2: "right", c1d: 1, c2d: 2),
        Story(t: "You see a tiger.", c1: "Shout for help", c2: "Play dead", c1d: 0, c2d: 0),
        Story(t: "You find a treasure chest.", c1: "Open it", c2: "Check for traps", c1d: 0, c2d: 0)
    ]
    
    var storyPage = 0
    
    func getStoryText () -> String {
        return storyBrain[storyPage].title
    }
    
    func getStoryOption1 () -> String {
        return storyBrain[storyPage].choise1
    }
    
    func getStoryOption2 () -> String {
        return storyBrain[storyPage].choise2
    }
    
    mutating func nextPage (usersChoise: String) {
        if storyBrain[storyPage].choise1 == usersChoise {
            storyPage = storyBrain[storyPage].choise1Destination
        } else {
            storyPage = storyBrain[storyPage].choise2Destination
        }
    }
}

