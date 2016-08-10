//
//  ViewController.swift
//  WeatherApp
//
//  Created by Héctor Moreno on 09/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperatureMax: UILabel!
    @IBOutlet weak var temperatureMin: UILabel!
    
    var weatherElements = [Weather]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.GET, "http://api.openweathermap.org/data/2.5/weather?lat=29.098578&lon=-110.998308&appid=3f3a608541a999f9d309a7f2b3f36ac7&units=metric", parameters: nil)
            .responseJSON { response in
                
                if let JSON = response.result.value as? [String: AnyObject] {
                    if let main = JSON["main"] as? [String: AnyObject] {
                        

                        
                        self.weatherElements.append(Weather(main: main))
                        self.temperatureLabel.text = ("\(String(self.weatherElements[0].temperature))º")
                        self.temperatureMax.text = ("Max temp = \(String(self.weatherElements[0].tempMax))º")
                        self.temperatureMin.text = ("Min temp = \(String(self.weatherElements[0].tempMin))º")

                        
                    }
                }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

