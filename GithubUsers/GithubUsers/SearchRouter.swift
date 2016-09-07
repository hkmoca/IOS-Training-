//
//  SearchRouter.swift
//  GithubUsers
//
//  Created by Héctor Moreno on 01/09/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import Foundation
import Alamofire


enum SearchRouter: URLRequestConvertible {
    
    static let baseURLString = "https://api.github.com"
    
    case getSearch(user: String)
    
    var method: Alamofire.Method {
        switch self {
        case .getSearch:
            return .GET
        }
    }
    
    var path: String {
        switch self {
        case .getSearch:
            return "/search/users"
        }
    }
    
    var URLRequest: NSMutableURLRequest {
        let URL = NSURL(string: SearchRouter.baseURLString)
        let mutableURLRequest = NSMutableURLRequest(URL: (URL?.URLByAppendingPathComponent(path))!)
            mutableURLRequest.HTTPMethod = method.rawValue
        let encoding = Alamofire.ParameterEncoding.URL
        
        switch self {
        case .getSearch(let userSearch):
            let parameters = [
                "q": userSearch,
            ]
            return encoding.encode(mutableURLRequest, parameters: parameters).0
        }
    }
}