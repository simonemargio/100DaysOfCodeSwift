//
//  WeatherModel.swift
//  Clima
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import Foundation

struct WeatherModel {
    let conditionID: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    // Computed property
    var conditionName: String {
        // When "call" conditionName this code return as string the condition that goes into conditionName
        switch conditionID {
        case 200...232: // Thunderstorm
            return "cloud.bolt"
        case 300...321: // Drizzle
            return "cloud.drizzle"
        case 500...531: // Rain
            return "cloud.rain"
        case 600...662: // Snow
            return "cloud.snow"
        case 701...781: // Fog
            return "cloud.fog"
        case 800: // Clear
            return "sun.min"
        case 801...804: // Clouds
            return "cloud"
        default:
            return "heart.fill"
        }
    }
    


}
