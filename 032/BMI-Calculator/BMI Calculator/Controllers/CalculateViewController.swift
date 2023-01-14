//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func sliderHeight(_ sender: UISlider) {
        let currentHeight = String(format: "%.2f", sender.value)
        heightLabel.text = currentHeight + "m"
    }
    

    @IBAction func sliderWeight(_ sender: UISlider) {
        let currentWeight = String(Int(sender.value))
        weightLabel.text = currentWeight + "Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(h: height, w: weight)
      
        
        // Call the storyboard goToResult
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    // This function is called before performSegue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // if we have more storyboards that are connected with Main.storyboard then we need to identify every storyboard
        if segue.identifier == "goToResult" {
            /* segue.destitnation point on UIViewController class. We need that point to
               ResultViewController that is a subclass of UIViewController (class ResultViewController: UIViewController)
               ad! ResultViewController done this.
               Summary: it's a downcast (the ! for force)
             */
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMI()
            destinationVC.advice = calculatorBrain.getBMIAdvice()
            destinationVC.color = calculatorBrain.getBMIColor()
        }
    }
}

