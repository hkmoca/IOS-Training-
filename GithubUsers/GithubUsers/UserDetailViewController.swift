//
//  UsersDetailViewController.swift
//  GithubUsers
//
//  Created by Héctor Moreno on 18/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userLoginName: UILabel!
    @IBOutlet weak var followers: UILabel!
    @IBOutlet weak var repos: UILabel!
    @IBOutlet weak var following: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let tableViewElements = ["Followers","Organization"]
    var user: User!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserDetails()
    }
    
    func getUserDetails() {
        
        let gitHubViewModel = GitHubViewModel()
    
        
            gitHubViewModel.getUserInfoDetail (user, completion: { (userDetails) in
            
            self.userName.text  = userDetails.userName
            self.userLoginName.text = userDetails.userLogin
            self.followers.text = String(userDetails.followers)
            self.following.text = String(userDetails.following)
            self.repos.text =     String(userDetails.publicRepos)
            self.userImage.af_setImageWithURL(userDetails.userImageUrl)
            },
             onFailure: { (error) in
              print(error)
                }
            )
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "userFollowers" {
            
            let usersDetailsView = segue.destinationViewController as! FollowersViewController
            usersDetailsView.user = user
            
           
            
        }
    }
    
    
}

extension UserDetailViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewElements.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("detailView", forIndexPath: indexPath)
        cell.textLabel!.text = tableViewElements[indexPath.row]
        return cell
    }
    
}
