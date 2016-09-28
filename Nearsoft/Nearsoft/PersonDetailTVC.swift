//
//  PersonDetailTableViewController.swift
//  Nearsoft
//
//  Created by Héctor Moreno on 21/09/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import UIKit
import AlamofireImage

class PersonDetailTVC: UITableViewController {

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var birthDate: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var skype: UILabel!
    @IBOutlet weak var role: UILabel!
                   var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let profilePicURL =  NSURL(string: "\(user.profilePic)")
        
        profilePic.layer.borderWidth = 1
        profilePic.layer.masksToBounds = false
        profilePic.layer.borderColor = UIColor.orangeColor().CGColor
        profilePic.layer.cornerRadius = profilePic.frame.height/2
        profilePic.clipsToBounds = true
        
        
        fullName.text = user.fullName
        
        mobileLabel.text = user.mobile
        emailLabel.text = user.email
        role.text = user.role
        skype.text = user.skype
        
        if user.profilePic == "" {
            profilePic.image = UIImage(named: "nearsoft-symbol")
        } else {
            profilePic.af_setImageWithURL(profilePicURL!)
        }

        
        let dayTimePeriodFormatter = NSDateFormatter()
        dayTimePeriodFormatter.dateFormat = "EEEE, dd, MMMM YYYY"
        
        if user.birthdate != nil {
        let dateString = dayTimePeriodFormatter.stringFromDate(user.birthdate!)
        birthDate.text = dateString
        } else {
        birthDate.text = "Birthdate not available"
        }
    }
    
    @IBAction func callNumber(sender: AnyObject) {
        if let url: NSURL = (NSURL(string: "tel://\(user.mobile)")){
            UIApplication.sharedApplication().openURL(url)
        }
    }

}

   
    // MARK: - Table view data source

//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

