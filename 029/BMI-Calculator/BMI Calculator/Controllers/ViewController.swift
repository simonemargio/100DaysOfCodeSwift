//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    var height = 1.5
    var weight = 100
    
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
        
        print("Height: \(height)\nWeight: \(weight)\nBMI: \(bmi)")
    
        // Create new view and show it
        let secondVC = SecondViewController()
        secondVC.bmiValue = String(bmi)
        self.present(secondVC, animated: true, completion: nil)
    }
    
}

