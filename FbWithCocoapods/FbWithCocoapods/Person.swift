//
//  Person.swift
//  FbWithCocoapods
//
//  Created by Héctor Moreno on 09/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import Foundation
import RealmSwift

class Person: Object {
    dynamic var name = ""
    dynamic var email = ""
    dynamic var FbID = ""

            var profileImageURL: NSURL! {
        return NSURL(string: "https://graph.facebook.com/\(FbID)/picture?type=large&return_ssl_resources=1")
    }
    
    

    override static func primaryKey() -> String? {
        return "email"
    }
    
    override static func ignoredProperties() -> [String] {
        return ["profileImageURL"]
    }
}
