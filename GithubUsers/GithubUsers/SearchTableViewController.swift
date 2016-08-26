//
//  SearchTableViewController.swift
//  GithubUsers
//
//  Created by Héctor Moreno on 23/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchResultsUpdating {
    var userElements = [User]()


    
    var searchController: UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchController = UISearchController(searchResultsController: nil)
        self.tableView.tableHeaderView = self.searchController.searchBar
        self.searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
    }
    
    func displaySearchResult() {
        let tosearch = self.searchController.searchBar.text!
        let gitHubViewModel = GitHubViewModel()
        gitHubViewModel.getSearchURL(tosearch, completion: { (searchResult) in
            
            self.userElements = searchResult
            self.tableView.reloadData()
            },
                 onFailure: { (error) in
                     print(error)
            }
        )
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "searchDetails" {
            
            let usersDetailsView = segue.destinationViewController as! UserDetailViewController
            let path = tableView.indexPathForSelectedRow
            usersDetailsView.user = userElements[path!.row]
        }
    }

    func updateSearchResultsForSearchController(searchController: UISearchController) {
        if self.searchController.searchBar.text?.lowercaseString != "" {
            displaySearchResult()
        }
       
    }
   

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

            return self.userElements.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellSearch", forIndexPath: indexPath)
        cell.textLabel?.text = self.userElements[indexPath.row].userLogin

        return cell
    }
  
}
