//
//  LoggedViewController.swift
//  FbWithCocoapods
//
//  Created by Héctor Moreno on 06/09/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import UIKit
import RealmSwift
import FBSDKLoginKit
import AlamofireImage

class LoggedViewController: UIViewController {
    let realm = try! Realm()
    let loginManager = FBSDKLoginManager()
    
    
    

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
           let persons = realm.objects(Person.self)
        
        let person = persons[0] as Person
            name.text = person.name
            email.text = person.email
            self.imageView.af_setImageWithURL(person.profileImageURL)
    }

    @IBAction func LogOut(sender: AnyObject) {
        
        self.loginManager.logOut()
        
        try! realm.write {
            realm.deleteAll()
        }
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.switchToLogin()
        
    }
}
