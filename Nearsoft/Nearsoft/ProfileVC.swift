//
//  ViewController.swift
//  Nearsoft
//
//  Created by Héctor Moreno on 08/09/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import UIKit

import GoogleSignIn
import RealmSwift
import AlamofireImage



class ProfileVC: UIViewController {
    let realm = try! Realm()
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let persons = realm.objects(User.self)
        let person = persons[0] as User
            nameLabel.text = person.fullName
            emailLabel.text = person.email
        let profilePicURL =  NSURL(string: "\(person.profilePic)")
        self.profileImage.af_setImageWithURL(profilePicURL!)
           
    }

       @IBAction func didTapSignOut(sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
        
        try! realm.write {
            realm.deleteAll()
        }
        
        SwitchViewManager.switchToLogin()
    }

}

