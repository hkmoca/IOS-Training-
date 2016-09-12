//
//  Person.swift
//  Nearsoft
//
//  Created by Héctor Moreno on 11/09/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import Foundation
import RealmSwift

class Person: Object {

   dynamic var userId: String = ""
   dynamic var idToken: String = ""
   dynamic var fullName: String = ""
   dynamic var givenName: String = ""
   dynamic var familyName: String = ""
   dynamic var email: String = ""
   dynamic var hostDomain: String = ""
   dynamic var profilePic: String = ""
           var profilePicURL: NSURL! {
            return NSURL(string: "\(profilePic)")
            }

    
    override static func primaryKey() -> String? {
        return "email"
    }
    
    override static func ignoredProperties() -> [String] {
            return ["profilePicURL"]
    }
}