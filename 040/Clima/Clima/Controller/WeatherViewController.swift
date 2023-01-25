//
//  ViewController.swift
//  Clima
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import UIKit

// With UITextFieldDelegate we can control when the user types on keyboard
class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextFiled: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* The textfield shuold report back to self/WeatherViewController
            Here the searchTextField tells to WeatherViewController (self) if there is a change in the state of searchTextFiled. Self is the delegate.
         */
        searchTextFiled.delegate = self
        weatherManager.delegate = self
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        // Close the keyboard
        searchTextFiled.endEditing(true)
        print(searchTextFiled.text!)
      

    }
    
    // Ask to delegate if the user presses the keyboard "go" button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // What to do after "go" button
        print("Keyboard go button pressed")
        searchTextFiled.endEditing(true)
        print(searchTextFiled.text!)
        return true
    }
    
    // What to do if the users decides to end writing
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("User has stopped writing")
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "wft"
            return false
        }
    }
    
    // Ask to delegate if the user has end to write
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("End")
        if let city = textField.text {
            //  Call the function for create API request and get data
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextFiled.text = ""
    }
    
    // Update Weather info
    func didUpdateWeather(_ weatherMeneger: WeatherManager, weather: WeatherModel) {
        /*
        The process of getting weather information over the internet can take time. If we manage the temperature change, weather icon and others from the main process our app will be blocked.
         It is therefore necessary to use a different process from the main one which, once the weather information has been obtained, allows the main process to change the labels.
         */
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.cityLabel.text = weather.cityName
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
        
    }
    
    // Menage error by Weather performeRequest or parseJSON
    func didFailWithError(error: Error) {
        print(error)	
    }
}

