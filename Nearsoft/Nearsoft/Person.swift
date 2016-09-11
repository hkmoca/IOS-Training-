//
//  Person.swift
//  Nearsoft
//
//  Created by Héctor Moreno on 11/09/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import Foundation
import GoogleSignIn

class Person {

    var userId: String?
    var idToken: String?
    var fullName: String?
    var givenName: String?
    var familyName: String?
    var email: String?
    
    

     func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
                withError error: NSError!) {
        
        if (error == nil) {
            
            self.userId = user.userID
            self.idToken = user.authentication.idToken
            self.fullName = user.profile.name
            self.givenName = user.profile.givenName
            self.familyName = user.profile.familyName
            self.email = user.profile.email
        
        } else {
            print("\(error.localizedDescription)")
        }
    }
}