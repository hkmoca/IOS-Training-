//
//  SecondViewController.swift
//  TableViewNames
//
//  Created by Héctor Moreno on 02/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var viaSegueLabel: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var email: UILabel!

    
    var person: Person!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      viaSegueLabel.text = person.firstName
      lastName.text      = person.lastName
      email.text         = person.email
    }

    
    

   

}
