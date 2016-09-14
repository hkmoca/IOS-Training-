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
    
    let nsconection = NSConection()
    
    func showEmployees(completion: (people: [User]) -> Void, onFailure: (error: NSError) -> Void){
        
            nsconection.getEmployees({ (json) in
                if let people: Array<User> = Mapper<User>().mapArray(json)!{
                    completion(people: people)
                } else {
                    print("Nop, Check the code")
                }
                }, onFailure: { (error) in
                    onFailure(error: error)
                }
        )
    }
    
    func showInterns(completion: (interns: [User]) -> Void, onFailure: (error: NSError) -> Void) {
    
            nsconection.getInterns({ (json) in
                if let interns: Array<User> = Mapper<User>().mapArray(json)!{
                    completion(interns: interns)
                } else {
                    print("Something´s wrong with the intens")
                }
                }, onFailure: { (error) in
                    onFailure(error: error)
                }
                )
    }
}