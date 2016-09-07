//
//  ViewController.swift
//  FormPerson
//
//  Created by Héctor Moreno on 01/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var addressText: UITextField!

 
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        }

 
    @IBAction func printToConsol(sender: AnyObject) {
        
        let user = Person(firstName: firstNameText.text!, lastName: lastNameText.text!, eMail: emailText.text!, address: addressText.text!)
        

//        let user = Person()
//        user.firstName = firstNAmeText.text!
//        user.lastName = lastNameText.text!
//        user.eMail = eMailText.text!
//        user.address = addressText.text!
        
        
        print("User First name: \(user.firstName), Last Name: \(user.lastName), Email: \(user.eMail), Address: \(user.address)")
        
    }

}

