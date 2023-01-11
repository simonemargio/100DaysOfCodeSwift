//
//  SecondViewController.swift
//  BMI Calculator
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import UIKit

class SecondViewController: UIViewController {
   
    var bmiValue = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         The view has no background color (it's transparent). So we use view.background with any colors prefer
         Under this there's a definition of the label.
         UIlabel() -> Create a label
         label.text = set text
         label.frame = identify the frame where pin the label (x=0 y=0 -> pin label on top left corner)
         view.addSubview = set the label into current view
         */
        view.backgroundColor = .white
        let label = UILabel()
        label.text = "Your bmi:" + bmiValue
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        view.addSubview(label)
    }
}
