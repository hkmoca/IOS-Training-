//
//  GitHubViewModel.swift
//  GithubUsers
//
//  Created by Héctor Moreno on 17/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import Foundation
import ObjectMapper

class GitHubViewModel {
    let gitHubConection = GitHubConection()
    
    func getUsers(completion: (user: [User]) -> Void, onFailure: (error: NSError) -> Void) {
       
        
            gitHubConection.getUser({ (json) in
            let user: Array<User> = Mapper<User>().mapArray(json)!
            completion(user: user)
        },
            onFailure: { (error) in
            onFailure(error: error)
            }
        )
    }
    
    func getUserDetails(user: User, completion: (userDetails: User) -> Void, onFailure: (error: NSError) -> Void) {
        
            gitHubConection.getUserDetails(user, completion: { (json) in
            let userDetails = Mapper<User>().map(json)
            completion(userDetails: userDetails!)
            },
                 onFailure: { (error) in
                 onFailure(error: error)
            }
        )
    }
    
    func getUserFollowers(user: User, completion: (userFollowers: [User]) -> Void, onFailure: (error: NSError) -> Void){
        
            gitHubConection.getUserFollowers(user, compleation: { (json) in
            let userFollowers: Array<User> = Mapper<User>().mapArray(json)!
            completion(userFollowers: userFollowers)
            },
                onFailure: { (error) in
                onFailure(error: error)
                }
        )
    }
    
    func getSearchResult(searchUser: String, completion: (searchResult: [User]) -> Void, onFailure: (error: NSError) -> Void, alert: (sendAlert: Bool) -> Void){
        
            gitHubConection.getSearchResults(searchUser, compleation: { (json) in
            
            if let searchResult: [User] = (Mapper<User>().mapArray(json["items"])){
                completion(searchResult: searchResult)
            } else {
                print("api rate limit exceeded, wait 1 min to continue!")
                alert(sendAlert: true)
                }
            },
                onFailure: { (error) in
                 onFailure(error: error)
                }
        )
    }
}