//
//  ContactsVC.swift
//  Nearsoft
//
//  Created by Héctor Moreno on 11/09/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import UIKit
import RealmSwift

class ContactsVC: UIViewController {
    //MARK: Properties
    
    @IBOutlet weak var tableView: UITableView!
    var people = [User]()
    var filteredPeople = [User]()
    var sortedNames = [User]()
    var person = User()
    var searchController = UISearchController(searchResultsController: nil)
    let contactModel = ContactModel()
  

    // MARK: View Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.scopeButtonTitles = ["All", "Employees", "Intern"]
        searchController.searchBar.delegate = self
        
        contactModel.displayPeople { (people) in
            self.people = people
            self.sortedNames = self.people.sort { $0.fullName < $1.fullName }
            self.tableView.reloadData()
        }
        
        
        
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All"){
        filteredPeople = people.filter { person in
            
            let hasTextConsidences = person.fullName.lowercaseString.containsString(searchText.lowercaseString)

            if scope == "Intern"{
                return hasTextConsidences && person.role == scope
            } else if scope == "Employees"{
                return hasTextConsidences && person.role != "Intern"
            }
            
            return hasTextConsidences
            
            }
        
        tableView.reloadData()
    }
    
// MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Details" {
    
            let indexPath = tableView.indexPathForSelectedRow
            if searchController.active && searchController.searchBar.text != "" {
                    
                    person = filteredPeople[indexPath!.row]
                    
            } else {
                    
                    person = sortedNames[indexPath!.row]
                    
            }
            
             let userDetailVC = segue.destinationViewController as! PersonDetailTableViewController
            
                 userDetailVC.user = person
        }
    }
}

//MARK: - Search

extension ContactsVC: UISearchResultsUpdating {
     func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
         filterContentForSearchText(searchController.searchBar.text!, scope: scope)
     }
 }

extension ContactsVC: UISearchBarDelegate {
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

// MARK: - Table View

extension ContactsVC: UITableViewDataSource{

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchController.active && searchController.searchBar.text != "" {
            
            return filteredPeople.count
        }
        
        return people.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath: indexPath) as? CustomCell
        if searchController.active && searchController.searchBar.text != "" {
            
            person = filteredPeople[indexPath.row]
            
        } else {
            
            person = sortedNames[indexPath.row]
        }

        cell?.userName.text = person.fullName
        cell?.email.text = person.email

        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    }
    
   
}