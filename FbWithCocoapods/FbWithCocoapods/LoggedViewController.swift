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


class LoggedViewController: UIViewController {
    let realm = try! Realm()
    

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
           let person = realm.objects(Person.self)
            name.text = person[0].name
            email.text = person[0].email
            let url = NSURL(string: "https://graph.facebook.com/\(person[0].FbID)/picture?type=large&return_ssl_resources=1")
        self.imageView.image = UIImage(data: NSData(contentsOfURL: url!)!)
        
        
        
    }

    @IBAction func LogOut(sender: AnyObject) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.switchBack()
        
        try! realm.write {
            realm.deleteAll()
        }
        
        
                
    }
}
