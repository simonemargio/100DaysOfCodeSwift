//
//  WeatherManager.swift
//  Clima
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import Foundation

struct WeatherManager {
    let weatherURL: String = "https://api.openweathermap.org/data/2.5/weather?appid={ YOUR WEATHER API HERE !}&units=metric"
    
    
    func fetchWeather(cityName: String) {
        // Set the city's name at the end of api request
        let urlString = "\(weatherURL)&q=\(cityName)"
        performeRequest(urlString: urlString)
    }
    
    func performeRequest(urlString: String) {        
        // Create a URL
        if let url = URL(string: urlString) {
            // CReate a URLSession
            let session = URLSession(configuration: .default)
            
            // Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                print("Request done!")
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    // Parsing the data obtained by request
                    parseJSON(weatherData: safeData)
                }
            }
            // Run the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            // Decode data into structs
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print("City: \(decodedData.name)\nTemp: \(decodedData.main.temp)\nDescription: \(decodedData.weather[0].description)")
        } catch {
            print("oh no! 🙃")
        }
    }
    
    /*
     Without closures
     let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
     
     func handle(data: Data?, response: URLResponse?, error: Error?) {
         print("Request done!")
         if error != nil {
             print(error!)
             return
         }
             if let safeData = data {
                 let dataString = String(data: safeData, encoding: .utf8)
                 print(dataString)
             }
         }
     */
}
