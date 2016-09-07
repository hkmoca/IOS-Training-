//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Héctor Moreno on 14/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import Foundation
import ObjectMapper

class WeatherViewModel {

    func getMainWeather(compleation: (weather: Weather) -> Void,  onFailure: (error: NSError) -> Void) {
        let weatherConection = WeatherConection()
            weatherConection.getWeather({ (json) in
                let weather = Mapper<Weather>().map(json)
            compleation (weather: weather!)
            },
            onFailure: { (error) in
             onFailure(error: error)
            }
        )
    }
    
    func getForecastWeather(compleation: (forecastElements: [Weather]) -> Void,  onFailure: (error: NSError) -> Void) {
        let weatherConection = WeatherConection()
            weatherConection.getWeatherForecast({ (json) in
                let forecastElements: Array<Weather> = Mapper<Weather>().mapArray(json["list"])!
                compleation (forecastElements: forecastElements)
            
            },
              onFailure: { (error) in
                onFailure(error: error)
            }
        )
    }
    
}

