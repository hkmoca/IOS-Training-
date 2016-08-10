//
//  Weather.swift
//  WeatherApp
//
//  Created by Héctor Moreno on 09/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import Foundation

class Weather {
    
    var temperature = 0.00
    var tempMax = 0.00
    var tempMin = 0.00
    var descriptionWeather: String = "wowow"
    
    init(){
        
    }
    init(dictionary: [String: AnyObject]) {
        
        if let descriptionW = dictionary["weather"]![0]!["description"] as? String {
            self.descriptionWeather = descriptionW
        }
        
        if let temperature = dictionary["main"]!["temp"] as? Double {
            
            self.temperature = temperature
            
        }
        
        if let tempMin = dictionary["main"]!["temp_min"] as? Double {
            
            self.tempMin = tempMin
            
        }
        
        if let tempMax = dictionary["main"]!["temp_max"] as? Double {
            
            self.tempMax = tempMax
            
        }
        
        
    }
    
}