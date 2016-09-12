//
//  NSRouter.swift
//  Nearsoft
//
//  Created by Héctor Moreno on 11/09/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    static let baseURLString = "http://peopledb-api.azurewebsites.net"
    
    case getUsers()
    
    var method: Alamofire.Method {
        switch self {
        case .getUsers:
            return .GET
        }
    }
    
    var path: String {
        
        switch self {
        case .getUsers:
            return "/api/Employees"
        }
    }
    
    var URLRequest: NSMutableURLRequest {
    let URL = NSURL(string: Router.baseURLString)
    let mutableURLRequest = NSMutableURLRequest(URL: (URL?.URLByAppendingPathComponent(path))!)
        mutableURLRequest.HTTPMethod = method.rawValue
    let enconding = Alamofire.ParameterEncoding.URL
        
        switch self {
        case .getUsers:
            return enconding.encode(mutableURLRequest, parameters: nil).0
        }
    }
}