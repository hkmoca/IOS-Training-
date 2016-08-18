//
//  UsersData.swift
//  GithubUsers
//
//  Created by Héctor Moreno on 17/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class UsersDataAPI: Mappable {

    var userName: String = ""
    var avatarImage: String = ""
    
    var gitHubAPIUrl: NSURL! {
        return NSURL(string: "https://api.github.com/users")
    }
    
    var userUrl: NSURL! {
        return NSURL(string: "\(gitHubAPIUrl)/\(userName)")
    }

    required init?(_ map: Map) {
        
    }
 
     func mapping(map: Map) {
        userName     <- map["login"]
        avatarImage  <- map["avatar_url"]
        
    }

}