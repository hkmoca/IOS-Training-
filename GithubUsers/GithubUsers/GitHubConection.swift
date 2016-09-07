//
//  GithubConection.swift
//  GithubUsers
//
//  Created by Héctor Moreno on 17/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import Foundation
import Alamofire

class GitHubConection {
    
    func getUser(completion: (json: [[String: AnyObject]]) -> Void, onFailure: (error: NSError) -> Void) {
    
        Alamofire.request(Router.getUsers())
            .responseJSON { response in
                
                switch response.result {
                    
                case.Success(let JSON):
                    completion(json: JSON as! [[String: AnyObject]])
                    
                case.Failure(let ERROR):
                    onFailure(error: ERROR)
                }
        }
    }
    
    func getUserDetails (user: User ,completion: (json: [String: AnyObject]) -> Void, onFailure: (error: NSError) -> Void) {
        
        Alamofire.request(Router.getUserDetail(user: user.userLogin))
            .responseJSON { response in
                
                switch response.result {
                    
                case.Success(let JSON):
                    completion(json: JSON as! [String: AnyObject])
                    
                case.Failure(let ERROR):
                    onFailure(error: ERROR)
                }
        }
    }
    
    
    func getUserFollowers (user: User, compleation: (json:  [[String: AnyObject]]) -> Void, onFailure: (error: NSError) -> Void) {
        
        Alamofire.request(Router.getUserFollowers(user: user.userLogin))
            .responseJSON { response in
                
                switch response.result {
                
                case.Success(let JSON):
                  
                    compleation(json: JSON as! [[String: AnyObject]])
                    
                case.Failure(let ERROR):
                    onFailure(error: ERROR)
                }
        }
    }
    
    func getSearchResults (searchUser: String, compleation: (json:  [String: AnyObject]) -> Void, onFailure: (error: NSError) -> Void) {
        
        Alamofire.request(SearchRouter.getSearch(user: searchUser))
            .responseJSON { response in
                
                switch response.result {
                    
                case.Success(let JSON):
                      if JSON is [String: AnyObject] {
                    compleation(json: JSON as! [String: AnyObject])
                      } else {
                        print("Error")
                    }
                case.Failure(let ERROR):
                    onFailure(error: ERROR)
                }
        }
    }
}
