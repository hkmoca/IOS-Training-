//
//  SwitchViewManager.swift
//  Nearsoft
//
//  Created by Héctor Moreno on 23/09/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import Foundation
import UIKit
class SwitchViewManager {
    
 static let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

   static func switchToLogged() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let nav = storyboard.instantiateViewControllerWithIdentifier("Main")
        appDelegate.window?.rootViewController = nav
        
    }
    
   static func switchToLogin(){
        let storyboard = UIStoryboard.init(name: "Login", bundle: nil)
        let nav = storyboard.instantiateViewControllerWithIdentifier("Login")
        appDelegate.window?.rootViewController = nav
        
    }


}