//
//  NSRouter.swift
//  Nearsoft
//
//  Created by Héctor Moreno on 11/09/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import Foundation
import Alamofire

enum NSRouter: URLRequestConvertible {

  
    static let baseURLString = "https://peopledb-api.azurewebsites.net"
  
    case getEmployees
    case getInterns
    
    var method: Alamofire.Method {
        switch self {
        case .getEmployees, .getInterns:
            return .GET
        }
    }
    
    var path: String {
        
        switch self {
        case .getEmployees:
            return "/api/v1/employees"
        case .getInterns:
            return "/api/v1/interns"
        }
    }
    
    var URLRequest: NSMutableURLRequest {
    let URL = NSURL(string: NSRouter.baseURLString)
    let mutableURLRequest = NSMutableURLRequest(URL: (URL?.URLByAppendingPathComponent(path))!)
        mutableURLRequest.HTTPMethod = method.rawValue
        mutableURLRequest.setValue("Bearer \(NSModel.getIdToken())", forHTTPHeaderField: "Authorization")
    let enconding = Alamofire.ParameterEncoding.URL
        
        switch self {
            
        case .getEmployees, .getInterns:
            return enconding.encode(mutableURLRequest, parameters: nil).0
        }
    }
}