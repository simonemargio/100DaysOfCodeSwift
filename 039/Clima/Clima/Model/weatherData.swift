//
//  weatherData.swift
//  Clima
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import Foundation

struct WeatherData: Codable {  // Codabole = Decodable AND Encodable
    let name: String
    let main: Main // "main" is a structure, so I create another struct for save "temp"
    let weather: [Weather]  // I want the type "description". See below, "weather" is an array with only 1 cell. The "description" is in weather[0].description
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}

/*
 Example of JSON data
 {
     "weather": [
         {
             "id": 804,
             "main": "Clouds",
             "description": "overcast clouds",
             "icon": "04n"
         }
     ],
     "main": {
         "temp": 21.93,
         "feels_like": 22.69,
         "temp_min": 21.43,
         "temp_max": 22.78,
         "pressure": 1014,
         "humidity": 96
     },
     "name": "Rome",
 }
 
 */
