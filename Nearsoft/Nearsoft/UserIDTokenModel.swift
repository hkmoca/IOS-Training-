//
//  UserViewModel.swift
//  Nearsoft
//
//  Created by Héctor Moreno on 21/09/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import UIKit
import RealmSwift

class UserIDTokenModel {
     static let realm = try! Realm()
    
    static func getIDToken() -> String {
       let persons = realm.objects(User.self)
        let user = persons[0] as User
        return user.idToken
    }
    
    
}