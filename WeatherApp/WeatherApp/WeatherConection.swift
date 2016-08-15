//
//  Conection.swift
//  WeatherApp
//
//  Created by Héctor Moreno on 12/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import Foundation
import Alamofire


class WeatherConection {

    func getWeather(completion: (json: [String: AnyObject]) -> Void, onFailure: (error: NSError) -> Void) {
        
    let mainPageWeather = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?lat=29.07&lon=-110.97&appid=3f3a608541a999f9d309a7f2b3f36ac7&units=metric")!
    
    Alamofire.request(.GET, mainPageWeather, parameters: nil)
        .responseJSON { response in
            
                switch response.result {
                    
                case .Success(let JSON):
                    completion(json: JSON as! [String: AnyObject])

                case .Failure(let ERROR):
                    onFailure(error: ERROR)
                }
            }
    }
    
    
    func getWeatherForecast(completion: (json: [String: AnyObject]) -> Void, onFailure: (error: NSError) -> Void) {
    
        let forecastPageWeather = NSURL(string: "http://api.openweathermap.org/data/2.5/forecast?lat=29.07&lon=-110.97&appid=3f3a608541a999f9d309a7f2b3f36ac7&units=metric&cnt=40")!

        Alamofire.request(.GET, forecastPageWeather, parameters: nil)
            .responseJSON { response in
                
                switch response.result {
                    
                case .Success(let JSON):
                    completion(json: JSON as! [String: AnyObject])
                    
                case .Failure(let ERROR):
                    onFailure(error: ERROR)
                }
        }
    }


}

