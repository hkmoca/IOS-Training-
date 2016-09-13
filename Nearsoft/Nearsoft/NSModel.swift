//
//  NSModel.swift
//  Nearsoft
//
//  Created by Héctor Moreno on 12/09/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import Foundation
import ObjectMapper

class NSModel {
    func showNSPeople(completion: (people: [User]) -> Void, onFailure: (error: NSError) -> Void){
        
        let nsconection = NSConection()
            nsconection.getPeople({ (json) in
                if let people: Array<User> = Mapper<User>().mapArray(json)!{
                    completion(people: people)
                } else {
                    print("Nop, Check the code")
                }
                },
                    onFailure: { (error) in
                    onFailure(error: error)
        }
        )
    }
}