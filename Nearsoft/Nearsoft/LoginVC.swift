//
//  ViewController.swift
//  Nearsoft
//
//  Created by Héctor Moreno on 08/09/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import UIKit
import Google
import GoogleSignIn

class LoginVC: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    var person = Person()
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         GIDSignIn.sharedInstance().uiDelegate = self
         GIDSignIn.sharedInstance().delegate = self
        
        var error: NSError?
        GGLContext.sharedInstance().configureWithError(&error)
        
        if error != nil {
            print (error)
            return
        }
        
       
    }
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
                withError error: NSError!) {
        
        if (error == nil) {
            // Perform any operations on signed in user here.
            var userId = user.userID                  // For client-side use only!
            person.idToken = user.authentication.idToken // Safe to send to the server
            var fullName = user.profile.name
            var givenName = user.profile.givenName
            var familyName = user.profile.familyName
            var email = user.profile.email
            print (user.profile.imageURLWithDimension(200))
        
            
        } else {
            print("\(error.localizedDescription)")
        }
    }
  
    
    @IBAction func googleSignIn(sender: AnyObject) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    @IBAction func didTapSignOut(sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
    }
}

