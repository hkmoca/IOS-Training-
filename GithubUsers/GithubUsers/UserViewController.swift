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

class UserViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var usersInfo = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        displayUsersInfo()
    }

    func displayUsersInfo() {
        
        let gitHubViewModel = GitHubViewModel()
        gitHubViewModel.getUserInfo({ (users) in
            
            self.usersInfo = users
            self.tableView.reloadData()
            },
                onFailure: { (error) in
                    print(error)
            }
        )
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "userDetail" {
            
            let usersDetailsView = segue.destinationViewController as! UserDetailViewController
            let path = tableView.indexPathForSelectedRow
                usersDetailsView.user = usersInfo[path!.row]
        }
    }
}

extension UserViewController: UITableViewDataSource {

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersInfo.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("UsersCell", forIndexPath: indexPath) as? CustomCell
        let user = usersInfo[indexPath.row]
        cell?.userName.text = user.userLogin
        cell?.avatarImage.af_setImageWithURL(user.userImageUrl)
        return cell!
    }

}