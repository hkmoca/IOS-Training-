//
//  Weather.swift
//  WeatherApp
//
//  Created by Héctor Moreno on 09/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import Foundation
import UIKit

class Weather {
    
    var temperature = 0.00
    var tempMax = 0.00
    var tempMin = 0.00
    var descriptionWeather: String = ""
    var imageIcon: String = ""
    var dateTime = 0.00
    
    
    var urlIcon: NSURL! {
        return NSURL(string: "http://openweathermap.org/img/w/\(imageIcon).png")
    }
    
    var firstPageWeather: NSURL! {
        return NSURL(string: "http://api.openweathermap.org/data/2.5/weather?lat=29.07&lon=-110.97&appid=3f3a608541a999f9d309a7f2b3f36ac7&units=metric")
    }
    
    var secondPageWeather: NSURL! {
        return NSURL(string: "http://api.openweathermap.org/data/2.5/forecast?lat=29.07&lon=-110.97&appid=3f3a608541a999f9d309a7f2b3f36ac7&units=metric&cnt=40" )
    }
    
    init(){
        
    }
    
    init(dictionary: [String: AnyObject]) {
        
        if let imageIcon = dictionary["weather"]![0]!["icon"] as? String {
            self.imageIcon = imageIcon
        }
        
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
        
        if let dateTime = dictionary["dt"] as? Double {
            self.dateTime = dateTime
        }
        
    }
    
}