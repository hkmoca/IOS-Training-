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
    
    let gitHubURL = NSURL(string: "https://api.github.com/users")!
    
    
    func getUser(completion: (json: [[String: AnyObject]]) -> Void, onFailure: (error: NSError) -> Void) {
    
        Alamofire.request(.GET, gitHubURL, parameters: nil)
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
        
        let URL = "\(gitHubURL)/\(user.userLogin)"
        Alamofire.request(.GET, URL, parameters: nil)
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
        
        let URL = "\(gitHubURL)/\(user.userLogin)/followers"
        
        Alamofire.request(.GET, URL, parameters: nil)
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
        
        
        let searchURL = NSURL(string: "https://api.github.com/search/users?q=")!
        let URL = "\(searchURL)\(searchUser)"
        
        Alamofire.request(.GET, URL, parameters: nil)
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
