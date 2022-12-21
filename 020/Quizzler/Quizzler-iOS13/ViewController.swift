//
//  ViewController.swift
//  Quizzler
//
//  Created by Simone Margio.
//  www.simonemargio.im
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    var timer = Timer()
    
    let quiz = [
        Question(q: "The Java compiler translates Java programs into machine language programs.", a: "False"),
        Question(q: "Pseudocode is a mixture of English and a programming language.", a: "True"),
        Question(q: "Polymorphism is a classification system for organizing classes in Java.", a: "False"),
        Question(q: "The boolean type has only two values.", a: "True"),
        Question(q: "Arithmetic with floating-point numbers is not exact.", a: "True"),
        Question(q: "A common practice that is used in the textbook is to start the names of variables with a capitalletter.", a: "False"),
        Question(q: "This app was made by Simone.", a: "True"),
        Question(q: "Google was originally called 'Backrub'.", a: "True")
    ]
    
    var currentQuestion = 0
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answareButton(_ sender: UIButton) {
        let userAnsware = sender.currentTitle!
        
        if userAnsware == quiz[currentQuestion].answare{
            print("True")
            sender.backgroundColor = UIColor.green
        } else {
            print("False")
            sender.backgroundColor = UIColor.red
        }
        
        if (currentQuestion < quiz.count - 1) {
            currentQuestion += 1
        } else {
            print("Restart")
            currentQuestion = 0
        }
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: true)

    
    }
    
    @objc func updateUI() {
        timer.invalidate()
        questionLabel.text = quiz[currentQuestion].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = Float(currentQuestion + 1) / Float(quiz.count)
    }
    
}

