//
//  Temp.swift
//  AlamoFire
//
//  Created by Héctor Moreno on 09/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import Foundation
import UIKit

class Temp {

    var temperature: Double
    var tempMax: Double
    var tempMin: Double
    
    init(main: [String: AnyObject] ) {
        
        if let temp = main["temp"] as? Double {
            
            self.temperature = temp
            
        }
        
        if let tempMin = main["temp_min"] as? Double {
            
            self.tempMin = tempMin
            
        }
        
        if let tempMax = main["humidity"] as? Double {
            
            self.tempMax = tempMax
            
        }
        

    }

}