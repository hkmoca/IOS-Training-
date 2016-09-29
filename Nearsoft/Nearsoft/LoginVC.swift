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
    var error: NSError?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GGLContext.sharedInstance().configureWithError(&error)
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        if error != nil {
            print (error)
            return
        }
        view.backgroundColor = UIColor(red: 0.95, green: 0.35, blue: 0.14, alpha: 1.0)
    }
    
    @IBAction func googlePlusButtonTouchUpInside(sender: AnyObject) {
        GIDSignIn.sharedInstance().signIn()
    }
    //MARK: - Login
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
                withError error: NSError!) {
        
        if (error == nil) {
            
            let person = User()
            person.userId = user.userID                  // For client-side use only!
            person.idToken = user.authentication.idToken // Safe to send to the server
            person.fullName = user.profile.name
            person.email = user.profile.email
            person.profilePic = String(user.profile.imageURLWithDimension(200))
            
            if (user.hostedDomain != nil) && user.hostedDomain == "nearsoft.com"{
                try! realm.write {
                    realm.add(person, update: true)
                }
                
                print(realm.configuration.fileURL)
                print(user.authentication.idToken)
                SwitchViewManager.switchToLogged()
                
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

