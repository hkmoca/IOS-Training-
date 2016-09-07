//
//  WeatherRouter.swift
//  WeatherApp
//
//  Created by Héctor Moreno on 07/09/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {

    static let baseURLString = "http://api.openweathermap.org"
    
    case getWeather()
    case getForecast()
    
    var method: Alamofire.Method {
        switch self {
        case .getWeather, .getForecast:
            return .GET
            
        }
    }
    
    var path: String {
        switch self {
        case .getWeather:
            return "/data/2.5/weather"
        case .getForecast:
            return "/data/2.5/forecast/"
        }
    }
    
    var URLRequest: NSMutableURLRequest{
    let URL = NSURL(string: Router.baseURLString)
    let mutableURLRequest = NSMutableURLRequest(URL: (URL?.URLByAppendingPathComponent(path))!)
        mutableURLRequest.HTTPMethod = method.rawValue
    let encoding = Alamofire.ParameterEncoding.URL
        
        switch self {
        case .getWeather:
            let parameters = [
            "lat": 29.07,
            "lon": -110.97,
            "appid": "3f3a608541a999f9d309a7f2b3f36ac7",
            "units": "metric"
            ]
            return encoding.encode(mutableURLRequest, parameters: parameters).0
            
        case .getForecast:
            let parameters = [
            "lat": "29.07",
            "lon": "-110.97",
            "appid": "3f3a608541a999f9d309a7f2b3f36ac7",
            "units": "imperial",
            "cnt": 40,
            ]
            return encoding.encode(mutableURLRequest, parameters: parameters).0
        }
    }
}
