//
//  Person.swift
//  FormPerson
//
//  Created by Héctor Moreno on 01/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import Foundation

class Person {
    var firstName: String = "Hector"
    var lastName: String = "Puto"
    var eMail: String = ""
    var address: String = ""
    
    init(firstName: String, lastName: String, eMail: String, address: String ) {
        self.firstName = firstName
        self.lastName = lastName
        self.eMail = eMail
        self.address = address
    }
    
    
}