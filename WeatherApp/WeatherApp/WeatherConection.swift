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
        
        Alamofire.request(Router.getWeather())
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

        Alamofire.request(Router.getForecast())
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

