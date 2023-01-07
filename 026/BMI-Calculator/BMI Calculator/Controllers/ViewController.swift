//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Simone Margio.
//  www.simonemargio.im
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    var height = 0.00
    var weight = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func sliderHeight(_ sender: UISlider) {
        let currentHeight = String(format: "%.2f", sender.value)
        heightLabel.text = currentHeight + "m"
        height = Double(currentHeight)!
    }
    

    @IBAction func sliderWeight(_ sender: UISlider) {
        let currentWeight = String(Int(sender.value))
        weightLabel.text = currentWeight + "Kg"
        weight = Int(currentWeight)!
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bmi = Float(weight) / Float((height * height))
        
        print("Height: \(height)\nWeight: \(weight)\nBMI: \(bmi)\n")
    }
    
}

