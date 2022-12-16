//
//  ViewController.swift
//  Xylophone
//
//  Created by Simone Margio.
//  www.simonemargio.im
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playSound(buttonPressed: UIButton) {
        guard let url = Bundle.main.url(forResource: buttonPressed.currentTitle, withExtension: "wav") else {
            print("File not found")
            return
        }
        do {
            print("Pressed Key: \(String(describing: buttonPressed.currentTitle))")
            buttonPressed.alpha = 0.5
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch {
            print(error)
        }
        
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(buttonPressed: sender)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                   //Bring's sender's opacity back up to fully opaque.
                   sender.alpha = 1.0
               }
    }
}

