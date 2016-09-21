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

    //static let baseURLString = "https://www.dropbox.com"
    static let baseURLString = "https://peopledb-api.azurewebsites.net"
    
    case getEmployees()
    case getInterns()
    
    var method: Alamofire.Method {
        switch self {
        case .getEmployees, .getInterns:
            return .GET
        }
    }
    
    var path: String {
        
        switch self {
        case .getEmployees:
            //return "/s/1je0rop2manf9w3/employees.json"
            return "/api/Employees"
        case .getInterns:
            return "/api/Interns"
            //return "/s/6edf3ely6vt8eps/interns.json"
        }
    }
    
    var URLRequest: NSMutableURLRequest {
    let URL = NSURL(string: NSRouter.baseURLString)
    let mutableURLRequest = NSMutableURLRequest(URL: (URL?.URLByAppendingPathComponent(path))!)
        mutableURLRequest.HTTPMethod = method.rawValue
    let enconding = Alamofire.ParameterEncoding.URL
        
        switch self {
        case .getEmployees, .getInterns:
            let parameters = [
            "raw": 1
            ]
            return enconding.encode(mutableURLRequest, parameters: parameters).0
        
        }
    }
}