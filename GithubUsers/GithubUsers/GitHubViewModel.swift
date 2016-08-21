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
    
    func getUserInfo(completion: (users: [User]) -> Void, onFailure: (error: NSError) -> Void) {
       
        let gitHubConection = GitHubConection()
            gitHubConection.getUserAPI({ (json) in
                let users: Array<User> = Mapper<User>().mapArray(json)!
            completion(users: users)
        },
            onFailure: { (error) in
            onFailure(error: error)
            }
        )
    }
    
    func getUserInfoDetail(userLogin: User, completion: (users: User) -> Void, onFailure: (error: NSError) -> Void) {
        
        let gitHubConection = GitHubConection()
        
        gitHubConection.getUserAPIDetails(userLogin, completion: { (json) in
            let users = Mapper<User>().map(json)
            completion(users: users!)
            },
                                    onFailure: { (error) in
                                        onFailure(error: error)
            }
        )
        
       
    }
}