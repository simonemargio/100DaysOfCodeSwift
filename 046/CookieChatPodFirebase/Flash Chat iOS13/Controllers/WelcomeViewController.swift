//
//  WelcomeViewController.swift
//  CookieChat
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import UIKit

// INFO: to enable the navigation bar: Editor -> Embed in -> Navigation controller

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = ""
        let titleText = "CookieChat"
        var charIndex = 0.0
        
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) {
                (timer) in // (timer) = name of the timer
                self.titleLabel.text?.append(letter)
                
            }
            charIndex += 1
        }
       
    }
    

}
