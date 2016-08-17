//
//  CustomCell.swift
//  WeatherApp
//
//  Created by Héctor Moreno on 10/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import SVProgressHUD

class ForecastViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var forecastElements = [Weather]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.showWithStatus("Working..")
        getForecastInfo()
    }
    
    func getForecastInfo() {
        
        let weatherViewModel = WeatherViewModel()
        weatherViewModel.getForecastWeather({ (forecastElements)  in
            SVProgressHUD.dismiss()
            self.forecastElements = forecastElements
            self.tableView.reloadData()
            },
                onFailure: { (error) in
                    print(error)
            }
        )
    }
    

}



extension ForecastViewController: UITableViewDataSource {

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastElements.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as? CustomCell
        let weather = forecastElements[indexPath.row]
        
            cell?.descriptionW.text = weather.descriptionWeather
            cell?.tempMax.text = ("\(String(weather.tempMax))º")
            cell?.tempMin.text = ("\(String(weather.tempMin))º")
            cell?.imageIcon.af_setImageWithURL(weather.urlIcon)
        
        
            let dateID = NSDate(timeIntervalSince1970: weather.dateTime)
            let dayTimePeriodFormatter = NSDateFormatter()
            dayTimePeriodFormatter.dateFormat = "MMM dd hh:mm a"
            let dateString = dayTimePeriodFormatter.stringFromDate(dateID)
        
            cell?.dateW.text = dateString
   
        return cell!
    
    }
    
    
   
    
    
}
