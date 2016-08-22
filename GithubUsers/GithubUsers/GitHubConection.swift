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
    
    
    func getUserAPI (completion: (json: [[String: AnyObject]]) -> Void, onFailure: (error: NSError) -> Void) {
    
        let gitHubConection = User()
        let gitHubAPIURL = gitHubConection.gitHubAPIUrl
        Alamofire.request(.GET, gitHubAPIURL, parameters: nil)
            .responseJSON { response in
                
                switch response.result {
                    
                case.Success(let JSON):
                    completion(json: JSON as! [[String: AnyObject]])
                    
                case.Failure(let ERROR):
                    onFailure(error: ERROR)
                }
        }
    }
    
    func getUserAPIDetails (userLogin: User ,completion: (json: [String: AnyObject]) -> Void, onFailure: (error: NSError) -> Void) {
        
        let gitHubConection = User()
        let gitHubAPIURL = gitHubConection.gitHubAPIUrl
        let gitHubURL = "\(gitHubAPIURL)/\(userLogin.userLogin)"
        Alamofire.request(.GET, gitHubURL, parameters: nil)
            .responseJSON { response in
                
                switch response.result {
                    
                case.Success(let JSON):
                    completion(json: JSON as! [String: AnyObject])
                    
                case.Failure(let ERROR):
                    onFailure(error: ERROR)
                }
        }
    }
    
    
    func getUserFollowers (userLogin: User, compleation: (json:  [[String: AnyObject]]) -> Void, onFailure: (error: NSError) -> Void) {
        
        let gitHubConection = User()
        let gitHubAPIURL = gitHubConection.gitHubAPIUrl
        let gitHubURL = "\(gitHubAPIURL)/\(userLogin.userLogin)/followers"
        
        Alamofire.request(.GET, gitHubURL, parameters: nil)
            .responseJSON { response in
                
                switch response.result {
                
                case.Success(let JSON):
                    compleation(json: JSON as! [[String: AnyObject]])
                    
                case.Failure(let ERROR):
                    onFailure(error: ERROR)
                }
        }
    }
    
}
