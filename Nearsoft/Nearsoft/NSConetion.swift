//
//  NSConetion.swift
//  Nearsoft
//
//  Created by Héctor Moreno on 12/09/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import Foundation
import Alamofire

class NSConection {
    
    func getEmployees(completion: (json: [[String: AnyObject]]) -> Void, onFailure: (error: NSError) -> Void) {
        
        Alamofire.request(NSRouter.getEmployees)
        .responseJSON { response in
           
            switch response.result {
                
            case.Success(let JSON):
                completion(json: JSON as! [[String: AnyObject]])
                
            case.Failure(let ERROR):
                onFailure(error: ERROR)
            }
        }
    }
    
    func getInterns(completion: (json: [[String: AnyObject]]) -> Void, onFailure: (error: NSError) -> Void) {
    
        Alamofire.request(NSRouter.getInterns)
        .responseJSON { (response) in
            
            switch response.result {
            
            case.Success(let JSON):
                    completion(json: JSON as! [[String: AnyObject]])
                
            case.Failure(let ERROR):
                    onFailure(error: ERROR)
            
            }
        }
    }
}