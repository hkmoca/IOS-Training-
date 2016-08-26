//
//  FollowersViewController.swift
//  GithubUsers
//
//  Created by Héctor Moreno on 21/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class FollowersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var followers = [User]()
    var user: User!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getUserFollowers()
    }
    
    
    func getUserFollowers() {
        let gitHubViewModel = GitHubViewModel()

        gitHubViewModel.getUserFollowers(user, completion:{ (userFollowers) in
            
            self.followers = userFollowers
            self.tableView.reloadData()
            
            },
                    onFailure: { (error) in
                    print(error)
            }
        )
    }


}

extension FollowersViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return followers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("UserFollowers", forIndexPath: indexPath) as? CustomCell
        
        let follower = followers[indexPath.row]
        cell?.userName.text = follower.userLogin
        cell?.avatarImage.af_setImageWithURL(follower.userImageUrl)
        
        
        return cell!
    }
    
}