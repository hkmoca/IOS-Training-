//
//  PersonDetailTableViewController.swift
//  Nearsoft
//
//  Created by Héctor Moreno on 21/09/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import UIKit

class PersonDetailTableViewController: UITableViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var akaLabel: UILabel!
    @IBOutlet weak var birthDate: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var clientLabel: UILabel!
    @IBOutlet weak var skype: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullName.text = user.fullName
        if user.nickname == "" {
            akaLabel.text = "No nickname"
        } else {
            akaLabel.text = user.nickname
        }
        
        mobileLabel.text = user.mobile
        clientLabel.text = user.clients
        skype.text = user.skype
        
        if user.profilePic == "" {
            profileImage.image = UIImage(named: "nearsoft-symbol")
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

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
 
*/
