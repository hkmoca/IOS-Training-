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
    
    

    override static func primaryKey() -> String? {
        return "email"
    }
}
