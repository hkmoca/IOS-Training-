//
//  RealmObject.swift
//  RealmTest
//
//  Created by Héctor Moreno on 09/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import Foundation
import RealmSwift


class Person: Object {

    dynamic var name = ""
    dynamic var lastName = ""
    dynamic var email =  ""
    dynamic var birthdate = NSDate(timeIntervalSinceReferenceDate: 1)
    
    
     override static func primaryKey() -> String? {
        return "email"
    }
}