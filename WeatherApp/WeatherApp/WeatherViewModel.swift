//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Héctor Moreno on 14/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import Foundation


class WeatherViewModel {

    func getMainWeather(compleation: (weather: Weather) -> Void,  onFailure: (error: NSError) -> Void) {
        
        let weatherConection = WeatherConection()
        
            weatherConection.getWeather({ (json) in
            
            let weather = Weather(dictionary: json)

            compleation (weather: weather)
            
            },
            onFailure: { (error) in
             onFailure(error: error)
            }
        )
    }
    
    func getForecastWeather(compleation: (forecastElements: [Weather]) -> Void,  onFailure: (error: NSError) -> Void) {
        
        var forecastElements = [Weather]()
        let weatherConection = WeatherConection()
        
            weatherConection.getWeatherForecast({ (json) in
            if let results = json["list"] as? [[String: AnyObject]] {
                
                for element in results {
                    
                    let data = Weather(dictionary: element)
                    forecastElements.append(data)
                }
            }

            compleation (forecastElements: forecastElements)
            
            },
              onFailure: { (error) in
                onFailure(error: error)
            }
        )
    }
    
}

