//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Artem Mazur on 15.07.2020.
//  Copyright © 2020 Artem Mazur. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func DidFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=fb2cb78a65e60ace92b5e0e99842caaa&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequets(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
           let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
           performRequets(with: urlString)
       }
    
    func performRequets(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.DidFailWithError(error: error!)
                    return
                }
                if let safeDate = data {
                    if let weather = self.parseJSON(safeDate) {
                        self.delegate?.didUpdateWeather(self ,weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
//            let latitude = decodedData.coord.lat
//            let longitude = decodedData.coord.lon
            
            
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
        } catch  {
            delegate?.DidFailWithError(error: error)
            return nil
        }
        
    }
    
}

