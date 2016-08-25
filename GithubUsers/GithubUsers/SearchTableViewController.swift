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
    var resultsController = UITableViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultsController.tableView.dataSource = self
        self.resultsController.tableView.delegate = self
        self.searchController = UISearchController(searchResultsController: self.resultsController)
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
            self.resultsController.tableView.reloadData()
            },
                                    onFailure: { (error) in
                                        print(error)
            }
        )
    }
    

    func updateSearchResultsForSearchController(searchController: UISearchController) {
        if self.searchController.searchBar.text?.lowercaseString != "" {
            displaySearchResult()
        }
        
        self.resultsController.tableView.reloadData()
        
    }
   

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView {
            return self.userElements.count
        } else {
            return self.userElements.count
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if tableView == self.tableView {
        cell.textLabel?.text = self.userElements[indexPath.row].userLogin
        } else{
        cell.textLabel?.text = self.userElements[indexPath.row].userLogin
        }
        return cell
    }
  
}
