//
//  UserDetailVC.swift
//  Nearsoft
//
//  Created by Héctor Moreno on 13/09/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import UIKit

class UserDetailVC: UIViewController {
    
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var akaLabel: UILabel!
    @IBOutlet weak var birthDate: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var clientLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullName.text = user.fullName
        akaLabel.text = user.aka
        birthDate.text = user.birthdate
        emailLabel.text = user.email
        mobileLabel.text = user.mobile
        clientLabel.text = user.clients
    }

}