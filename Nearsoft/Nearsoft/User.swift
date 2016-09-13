//
//  Person.swift
//  Nearsoft
//
//  Created by Héctor Moreno on 11/09/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import Foundation
import RealmSwift
import Realm
import ObjectMapper


class User: Object, Mappable {

   dynamic var userId:      String = ""
   dynamic var idToken:     String = ""
   dynamic var fullName:    String = ""
   dynamic var givenName:   String = ""
   dynamic var familyName:  String = ""
   dynamic var email:       String = ""
   dynamic var hostDomain:  String = ""
   dynamic var profilePic:  String = ""
           var yearsAtNS:   Int = 0
           var mobile:      String = ""
           var clients:     String = ""
           var startDate:   String = ""
           var location:    Int = 0
           var role:        String = ""
           var birthdate:   String = ""
           var aka:         String = ""
    
           var profilePicURL: NSURL! {
            return NSURL(string: "\(profilePic)")
            }
    
    required convenience init?(_ map: Map) {
        self.init()
        
    }
    
    override static func primaryKey() -> String? {
        return "email"
    }
    
    override static func ignoredProperties() -> [String] {
            return ["profilePicURL", "yearsAtNS", "mobile", "clients", "startDate", "location", "role", "birthdate", "aka" ]
    }
    
    func mapping(map: Map) {
        userId          <- map["id"]
        fullName        <- map["fullName"]
        givenName       <- map["name"]
        email           <- map["email"]
        yearsAtNS       <- map["yearsAtNS"]
        mobile          <- map["mobile"]
        clients         <- map["clients"]
        startDate       <- map["startDate"]
        location        <- map["location"]
        role            <- map["role"]
        birthdate       <- map["birthdate"]
        aka             <- map["aka"]
    }
}

