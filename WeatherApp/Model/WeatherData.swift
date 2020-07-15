//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Artem Mazur on 15.07.2020.
//  Copyright © 2020 Artem Mazur. All rights reserved.
//

import Foundation

struct WeatherData: Codable {

    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    
    let temp: Double
    
}

struct Weather: Codable {
    
    let id: Int
    
}

