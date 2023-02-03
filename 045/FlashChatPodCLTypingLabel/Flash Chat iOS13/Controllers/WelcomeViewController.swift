//
//  WelcomeViewController.swift
//  Flash Chat
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "⚡️FlashChat"
        
        
        
        /*titleLabel.text = ""
        let titleText = "⚡️FlashChat"
        var charIndex = 0.0
        
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) {
                (timer) in // (timer) = name of the timer
                self.titleLabel.text?.append(letter)
                
            }
            charIndex += 1
        }*/
       
    }
    

}
