//
//  ViewController.swift
//  Quizzler
//
//  Created by Simone Margio.
//  simonemargio.im
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var buttonOption1: UIButton!
    @IBOutlet weak var buttonOption2: UIButton!
    @IBOutlet weak var buttonOption3: UIButton!
    
    var timer = Timer()
    var quizzBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answareButton(_ sender: UIButton) {
        let userAnsware = sender.currentTitle!
        let answareChecked = quizzBrain.checkAnsware(userAnsware)
        
        if answareChecked {
            print("True")
            sender.backgroundColor = UIColor.green
        } else {
            print("False")
            sender.backgroundColor = UIColor.red
        }
        
        quizzBrain.nextQuestion()
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: true)
    }
    
    @objc func updateUI() {
        timer.invalidate()
        questionLabel.text = quizzBrain.getQuestionText()
        progressBar.progress = quizzBrain.getProgress()
        scoreLabel.text = "Score: \(quizzBrain.updateScore())"
        let buttonOptions = quizzBrain.getAnswareOptions()
        buttonOption1.setTitle(buttonOptions[0], for: .normal)
        buttonOption2.setTitle(buttonOptions[1], for: .normal)
        buttonOption3.setTitle(buttonOptions[2], for: .normal)
        buttonOption1.backgroundColor = UIColor.clear
        buttonOption2.backgroundColor = UIColor.clear
        buttonOption3.backgroundColor = UIColor.clear

    }
    
}

