//
//  ViewController.swift
//  WeatherApp
//
//  Created by Héctor Moreno on 09/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire
import SVProgressHUD

class ViewController: UIViewController {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperatureMax: UILabel!
    @IBOutlet weak var temperatureMin: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageIcon: UIImageView!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SVProgressHUD.show()
        getWeatherInfo()
        
    }
    
    @IBAction func reloadButton(sender: AnyObject) {
        
        getWeatherInfo()
    
    }
    
    func getWeatherInfo() {
        
        let weatherViewModel = WeatherViewModel()
        weatherViewModel.getMainWeather({ (weather)  in
            
            self.temperatureLabel.text = ("\(String(weather.temperature))º")
            self.temperatureMax.text  = ("Max \(String( weather.tempMax))º")
            self.temperatureMin.text  = ("Min \(String(weather.tempMin))º")
            self.descriptionLabel.text = weather.descriptionWeather
            self.imageIcon.af_setImageWithURL(weather.urlIcon)
            SVProgressHUD.dismiss()
            
            },
                                                        
                onFailure: { (error) in
                print(error)
            }
        )
    }
}



