//
//  ContactsVC.swift
//  Nearsoft
//
//  Created by Héctor Moreno on 11/09/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import UIKit
import Google
import GoogleSignIn

class ContactsVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var people = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        displayPeople()
        
    }
    
    func displayPeople(){
        let nsModel = NSModel()
            nsModel.showNSPeople({ (people) in
                self.people = people
                self.tableView.reloadData()
                }, onFailure: { (error) in
                    print ("Something went wrong!!!!!!!!!!!!!!!!!!!!!**********")
                }
            )
    }
}

extension ContactsVC: UITableViewDataSource{

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let person = people[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath: indexPath) as? CustomCell
        cell?.userName.text = person.fullName
        cell?.email.text = person.email
        
        return cell!
    }
    


}