//
//  UserDetailVC.swift
//  Nearsoft
//
//  Created by Héctor Moreno on 13/09/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import UIKit

class UserDetailVC: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
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
        if user.aka == "" {
        akaLabel.text = "Not Available"
        } else {
        akaLabel.text = user.aka
        }
        
        //emailLabel.text = user.email
        mobileLabel.text = user.mobile
        clientLabel.text = user.clients
        if user.profilePic == "" {
        profileImage.image = UIImage(named: "nearsoft-symbol")
        }
        
        
        let dayTimePeriodFormatter = NSDateFormatter()
        dayTimePeriodFormatter.dateFormat = "EEEE, dd, MMMM YYYY"
        let dateString = dayTimePeriodFormatter.stringFromDate(user.birthdate!)
        birthDate.text = dateString
        
        
    }

    @IBAction func callNumber(sender: AnyObject) {
        if let url: NSURL = (NSURL(string: "tel://\(user.mobile)")){
            UIApplication.sharedApplication().openURL(url)
        }
    }
}