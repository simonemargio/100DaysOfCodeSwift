//
//  ViewController.swift
//  EggTimer
//
//  Created by Simone Margio.
//  www.simonemargio.im
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var topLable: UILabel!
    @IBOutlet weak var timerBar: UIProgressView!
    
    let eggTimes = ["Soft": 5, "Medium": 8, "Hard": 12]
    var timer = Timer()
    var player: AVAudioPlayer!
    var totalTime = 0
    var secondPassed = 0
    
    @IBAction func eggPressed(_ sender: UIButton) {
        timer.invalidate()
        timerBar.progress = 0.0
        print("A \(sender.currentTitle!) egg requires \(eggTimes[sender.currentTitle!]!) minutes!")
        
        totalTime = eggTimes[sender.currentTitle!]! //* 60
        topLable.text = sender.currentTitle!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
       
    }
    
    @objc func update() {
        if(secondPassed <= totalTime) {
            let percenteProgress = Float(secondPassed) / Float(totalTime)
            print("Progress: \(percenteProgress)")
            timerBar.progress = percenteProgress
            secondPassed += 1
        } else {
            timer.invalidate()
            secondPassed = 0
            topLable.text = "Done! ☺️"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }

}
