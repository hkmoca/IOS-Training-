//
//  RealmObject.swift
//  RealmTest
//
//  Created by Héctor Moreno on 09/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import Foundation
import RealmSwift

class RealmObject: Object {
    
    dynamic var name = ""
    dynamic var owner: Person?

}

class Person: Object {

    dynamic var name = ""
    dynamic var birthdate = NSDate(timeIntervalSinceReferenceDate: 1)
}