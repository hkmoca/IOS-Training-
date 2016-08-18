//
//  GithubConection.swift
//  GithubUsers
//
//  Created by Héctor Moreno on 17/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import Foundation
import Alamofire

class GithubConection {
    
    
    func getUsersAPI (completion: (json: [String: AnyObject]) -> Void, onFailure: (error: NSError) -> Void) {
       
    
    let gitHubAPI = NSURL(string: "https://api.github.com/users")!
    
        Alamofire.request(.GET, gitHubAPI, parameters: nil)
            .responseJSON { response in
                
                switch response.result {
                    
                case.Success(let JSON):
                    completion(json: JSON as! [String: AnyObject])
                    
                case.Failure(let ERROR):
                    onFailure(error: ERROR)
                }
        }
    }
}
