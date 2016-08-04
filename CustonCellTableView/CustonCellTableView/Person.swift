//
//  Person.swift
//  CustonCellTableView
//
//  Created by Héctor Moreno on 04/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import UIKit


class Person {
    
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var profileImage: UIImage
    var fullName: String = ""
    
    init(firstName: String, lastName: String, email: String, profileImage: UIImage){
        self.firstName = firstName
        self.lastName  = lastName
        self.email     = email
        self.profileImage = profileImage
        fullName = "\(firstName) \(lastName)"
    }
    
}