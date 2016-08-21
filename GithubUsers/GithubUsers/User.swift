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

class UsersDataElements: Mappable {

    var userLogin: String = ""
    var userName: String = ""
    var followers: Int = 0
    var following: Int = 0
    var publicRepos: Int = 0
    var avatarImageStringUrl: String = ""
    
    
    var gitHubAPIUrl: NSURL! {
        return NSURL(string: "https://api.github.com/users")
    }
    var image: NSURL! {
        return NSURL(string: "\(avatarImageStringUrl)")
    }
    
    var userUrl: NSURL! {
        return NSURL(string: "\(gitHubAPIUrl)/\(userLogin)")
    }

    
    init() {
    
    }
    
    required init?(_ map: Map) {
        
    }
 
     func mapping(map: Map) {
        userName              <- map["name"]
        userLogin             <- map["login"]
        avatarImageStringUrl  <- map["avatar_url"]
        followers             <- map["followers"]
        following             <- map["following"]
        publicRepos           <- map["public_repos"]
        
        
    }

}