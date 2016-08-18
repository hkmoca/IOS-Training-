//
//  Weather.swift
//  WeatherApp
//
//  Created by Héctor Moreno on 09/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class Weather: Mappable {
    
    var temperature = 0.00
    var tempMax = 0.00
    var tempMin = 0.00
    var descriptionWeather: String = ""
    var imageIcon: String = ""
    var dateTime = 0.00
    var urlIcon: NSURL! {
        return NSURL(string: "http://openweathermap.org/img/w/\(imageIcon).png")
    }

    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        temperature             <- map["main.temp"]
        tempMax                 <- map["main.temp_max"]
        tempMin                 <- map["main.temp_min"]
        descriptionWeather      <- map["weather.0.description"]
        imageIcon               <- map["weather.0.icon"]
        dateTime                <- map["dt"]
    }
}