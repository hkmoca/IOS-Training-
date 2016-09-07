//
//  UsersRouter.swift
//  GithubUsers
//
//  Created by Héctor Moreno on 01/09/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {

static let baseURLString = "https://api.github.com"
    
    case getUsers()
    case getUserDetail(user: String)
    case getUserFollowers(user: String)
    
    var method: Alamofire.Method {
        switch self {
        case .getUsers,
             .getUserDetail,
             .getUserFollowers:
            return .GET
        }
    }

    var path: String {
    
        switch self {
        case .getUsers:
            return "/users"
        case .getUserDetail(let userName):
            return "/users/\(userName)"
        case .getUserFollowers(let userName):
            return "/users/\(userName)/followers"
        }
    }

    var URLRequest: NSMutableURLRequest{
    let URL = NSURL(string: Router.baseURLString)
    let mutableURLRequest = NSMutableURLRequest(URL: (URL?.URLByAppendingPathComponent(path))!)
        mutableURLRequest.HTTPMethod = method.rawValue
    let encoding = Alamofire.ParameterEncoding.URL
        
        switch self {
        case .getUsers, .getUserDetail, .getUserFollowers:
            return encoding.encode(mutableURLRequest, parameters: nil).0
        }
    }
}