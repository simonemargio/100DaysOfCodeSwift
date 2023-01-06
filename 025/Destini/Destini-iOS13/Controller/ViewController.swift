//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Simone Margio.
//  www.simonemargio.im
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    var story = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func choiseMade(_ sender: UIButton) {
        let userChoise = sender.currentTitle!
        story.nextPage(usersChoise: userChoise)
        updateUI()
    }
    
    func updateUI () {
        storyLabel.text = story.getStoryText()
        choice1Button.setTitle(story.getStoryOption1(), for: .normal)
        choice2Button.setTitle(story.getStoryOption2(), for: .normal)
    }
    
}

