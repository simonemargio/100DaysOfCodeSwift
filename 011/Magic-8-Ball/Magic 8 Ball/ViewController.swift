//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Simone Margio.
//  www.simonemargio.im
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ballView: UIImageView!
    let ballArray = [#imageLiteral(resourceName: "ball5"),#imageLiteral(resourceName: "ball2.png"),#imageLiteral(resourceName: "ball3.png"),#imageLiteral(resourceName: "ball4.png"),#imageLiteral(resourceName: "ball5.png")]
    
    @IBAction func askPressed(_ sender: UIButton) {
        ballView.image = ballArray.randomElement()!
    }
    
}

