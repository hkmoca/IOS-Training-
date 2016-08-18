//
//  FirstViewController.swift
//  GithubUsers
//
//  Created by Héctor Moreno on 17/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class FirstViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var usersElements = [UsersDataElements]()

    override func viewDidLoad() {
        super.viewDidLoad()
        displayUsersInfo()
    }

    func displayUsersInfo() {
        
        let gitHubViewModel = GitHubViewModel()
        gitHubViewModel.getUsersInfo({ (users) in
            self.usersElements = users
            self.tableView.reloadData()
            },
                onFailure: { (error) in
                    print(error)
            }
        )
    }
    
}

extension FirstViewController: UITableViewDataSource {

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersElements.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("UsersCell", forIndexPath: indexPath) as? CustomCell
        let diplayInfo = usersElements[indexPath.row]
        cell?.avatarImage.af_setImageWithURL(diplayInfo.image)
        cell?.userName.text = diplayInfo.userName
        return cell!
    }

}