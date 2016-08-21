//
//  UsersDetailViewController.swift
//  GithubUsers
//
//  Created by Héctor Moreno on 18/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import UIKit
class UsersDetailViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userLoginName: UILabel!
    @IBOutlet weak var followers: UILabel!
    @IBOutlet weak var repos: UILabel!
    @IBOutlet weak var following: UILabel!
    @IBOutlet weak var tableView: UITableView!
    let tableViewElements = ["Followers","Organization"]
    
    var user: User!
    
    
    let gitHubViewModel = GitHubViewModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        displayUsersInfo()
    }
    
    func displayUsersInfo() {
       let userLogin = user
        
        gitHubViewModel.getUsersInfoDetail (userLogin, completion: { (users) in
            
            
            self.userLoginName.text = self.user.userLogin
            self.userImage.af_setImageWithURL(self.user.image)
            self.followers.text = String(users.followers)
            self.following.text = String(users.following)
            self.repos.text =     String(users.publicRepos)
            self.userName.text  = users.userName
            },
             onFailure: { (error) in
              print(error)
                }
            )
    }
}

extension UsersDetailViewController: UITableViewDataSource {
    
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
