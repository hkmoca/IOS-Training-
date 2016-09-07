//
//  Person.swift
//  TableViewNames
//
//  Created by Héctor Moreno on 02/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import Foundation

class Person {

    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    
    
    init(firstName: String, lastName: String, email:String){
        self.firstName = firstName
        self.lastName  = lastName
        self.email     = email
    }

}