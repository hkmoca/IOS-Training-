//
//  ViewController.swift
//  RealmTest
//
//  Created by Héctor Moreno on 08/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    let realm = Realm?()
    
    @IBOutlet weak var name: UILabel!
    @IBAction func simon(sender: AnyObject) {
        
       
        let newDog = Person()
        newDog.name = "hector"
        newDog.lastName = "moreno"
        newDog.email = "hmoreno@blaha"
        
        // Get the default Realm
        let realm = try! Realm()
        // You only need to do this once (per thread)
        
        // Add to the Realm inside a transaction
        try! realm.write {
             realm.add(newDog, update: true)
        }
        
         print(realm.configuration.fileURL)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateBtn(sender: AnyObject) {
        let newDog = Person()
        newDog.name = "hector"
        newDog.lastName = "cano"
        newDog.email = "hmoreno@blajojoha"
        
        
        // Get the default Realm
        let realm = try! Realm()
        // You only need to do this once (per thread)
        
        // Add to the Realm inside a transaction
        try! realm.write {
            realm.add(newDog, update: true)
        }
        
        print(realm.configuration.fileURL)
        
        let dogs = realm.objects(Person.self)
        name.text = dogs[0].name
        
    }
    

}
    
    
    

