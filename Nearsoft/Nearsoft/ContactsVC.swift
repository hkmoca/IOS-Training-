//
//  ContactsVC.swift
//  Nearsoft
//
//  Created by Héctor Moreno on 11/09/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import UIKit

class ContactsVC: UIViewController {
    //MARK: Properties
    
    @IBOutlet weak var tableView: UITableView!
    var person = User()
    var people = [User]()
    var filteredPeople = [User]()
    let contactModel = ContactViewModel()
    var refreshControl = UIRefreshControl()
    var searchController = UISearchController(searchResultsController: nil)
        // MARK: View Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchBar = searchController.searchBar
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.scopeButtonTitles = ["All", "Employees", "Intern"]
        searchController.searchBar.delegate = self
        
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: #selector(ContactsVC.refresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
        self.tableView?.addSubview(refreshControl)
        
        searchBar.tintColor = UIColor.orangeColor()
        
        displayPeople()
        
    }
    
    func refresh(sender:AnyObject) {
        displayPeople()
    }
    
    func displayPeople() {
        
        contactModel.displayPeople ({ (people) in
            self.people = people
            self.tableView.reloadData()
            if self.refreshControl.refreshing {
                self.refreshControl.endRefreshing()
            }
            }, failure: { (error) in
                
                    let alert = UIAlertController(title: "Ops!", message: "Something´s wrong with your internet conection, pull down to try again", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                    if self.refreshControl.refreshing {
                        
                        self.refreshControl.endRefreshing()
                        
                    }
                })
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All"){
        filteredPeople = people.filter { person in
            let hasTextCoincidences = person.fullName.lowercaseString.containsString(searchText.lowercaseString)
            if scope == "Intern"{
                
                return hasTextCoincidences && person.role == scope
                
            } else if scope == "Employees"{
                
                return hasTextCoincidences && person.role != "Intern"
                
            }
            return hasTextCoincidences
            
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
                
                person = people[indexPath!.row]
            }
            
            let userDetailVC = segue.destinationViewController as! PersonDetailTVC
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
            
            person = people[indexPath.row]
        }
        
        let profilePicURL =  NSURL(string: "\(person.profilePic)")
        var fullNameArray = person.fullName.componentsSeparatedByString(" ")
        let initialOnName = fullNameArray[0][fullNameArray[0].startIndex]
        let initialOnLastName = fullNameArray[1][fullNameArray[1].startIndex]
        
        cell?.userName.text = person.fullName
        cell?.email.text = person.email
        
        
        cell?.profilePic.image = nil
        
        
        if person.profilePic == ""{
            cell?.initialsName.text = ("\(initialOnName)\(initialOnLastName)")
            cell?.initialsName.hidden = false
            
        } else {
            cell?.profilePic.af_setImageWithURL(profilePicURL!)
            cell?.initialsName.hidden = true
            
        }
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}