//
//  PersonDetailTableViewController.swift
//  Nearsoft
//
//  Created by Héctor Moreno on 21/09/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import UIKit
import AlamofireImage
import MessageUI

class PersonDetailTVC: UITableViewController, MFMailComposeViewControllerDelegate {

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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        if indexPath.section == 0 && indexPath.row == 2 {
            print ("Selected email")
            let mailComposeViewController = configureMailComposeViewController()
            if MFMailComposeViewController.canSendMail() {
                self.presentViewController(mailComposeViewController, animated: true, completion: nil)
            } else {
                self.showSendMailErrorAlert()
            }
            
        }
    }
    
    func configureMailComposeViewController() -> MFMailComposeViewController{
        let mailComposerVC = MFMailComposeViewController()
            mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["\(user.email)"])
        mailComposerVC.setSubject("")
        mailComposerVC.setMessageBody("Send it from Nearsoft People app", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertController(title: "Could not send Email", message: "Your device could not send e-mail", preferredStyle: UIAlertControllerStyle.Alert)
            sendMailErrorAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(sendMailErrorAlert, animated: true, completion: nil)

    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        
        switch result.rawValue {
        case MFMailComposeResultCancelled.rawValue:
            print("Cancelled mail")
        case MFMailComposeResultSent.rawValue:
            print("Mail Sent")
        default:
            break
            
        }
        self.dismissViewControllerAnimated(true, completion: nil)
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

