//
//  ViewController.swift
//  Clima
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import UIKit


class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextFiled: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        // Close the keyboard
        searchTextFiled.endEditing(true)
        print(searchTextFiled.text!)
    }
}

