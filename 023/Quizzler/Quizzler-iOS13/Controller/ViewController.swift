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
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
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
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

