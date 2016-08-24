//
//  SearchTableViewController.swift
//  GithubUsers
//
//  Created by Héctor Moreno on 23/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchResultsUpdating {
    
let dogs = [""]
    var filteredDogs = [String]()
    
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
    

    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.filteredDogs = self.dogs.filter { (dog: String) -> Bool in
            if dog.containsString(self.searchController.searchBar.text!) {
                return true
            } else {
                return false
            }
        }
        
        self.resultsController.tableView.reloadData()
        
    }
   

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView {
            return dogs.count
        } else {
            return self.filteredDogs.count
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if tableView == self.tableView {
        cell.textLabel?.text = self.dogs[indexPath.row]
        } else{
        cell.textLabel?.text = self.filteredDogs[indexPath.row]
        }
        return cell
    }
  
}
