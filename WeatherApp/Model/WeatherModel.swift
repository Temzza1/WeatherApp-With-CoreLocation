//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Artem Mazur on 15.07.2020.
//  Copyright © 2020 Artem Mazur. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var tempratureString: String {
        return String(format: "%.1f", temperature)
    }
    
//    var tempSTR: String {
//        return (String(format: "%1f", temperature))
//    }
    
    
    
    
    var conditionName: String {
        switch conditionId {
            case 200...232:
            return "cloud.bolt"
            case 300...321:
            return ("cloud.drizzle")
            case 500...531:
            return ("cloud.rain")
            case 600...622:
            return ("snow")
            case 702:
            return ("smoke")
            case 741:
            return ("fog")
            case 781:
            return ("tornado")
            case 800:
            return ("sun.max")
            case 801...804:
            return ("cloud")
            default:
            return ("error")
        }
    }
    
}

