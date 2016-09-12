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
import RealmSwift

class LoginVC: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    
    let realm = try! Realm()
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         GIDSignIn.sharedInstance().uiDelegate = self
         GIDSignIn.sharedInstance().delegate = self
        
        
//        var error: NSError?
//        GGLContext.sharedInstance().configureWithError(&error)
//        
//        if error != nil {
//            print (error)
//            return
//        }
        
       
    }
    
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
                withError error: NSError!) {
        
        if (error == nil) {
            // Perform any operations on signed in user here.
            let person = GoogleUser()
            person.userId = user.userID                  // For client-side use only!
            person.idToken = user.authentication.idToken // Safe to send to the server
            person.fullName = user.profile.name
            person.givenName = user.profile.givenName
            person.familyName = user.profile.familyName
            person.email = user.profile.email
            person.profilePic = String(user.profile.imageURLWithDimension(200))

            if (user.hostedDomain != nil) {
            person.hostDomain = user.hostedDomain
            }
            
            if person.hostDomain == "nearsoft.com" {
                try! realm.write {
                    realm.add(person, update: true)
                }
                
                print(realm.configuration.fileURL)
                
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                appDelegate.switchToLogged()
                
            } else {
                print ("Nop te la pelaste")
                GIDSignIn.sharedInstance().signOut()
                alert()
                
            }
            
        } else {
            print("\(error.localizedDescription)")
        }
    }
    
    func alert(){
        
        let alert = UIAlertController(title: "Stop", message: "Please, LogIn with a valid Nearsoft account", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }

}

