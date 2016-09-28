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
    var profileUser = User()
    var person = User()
    var searchController = UISearchController(searchResultsController: nil)
    let contactModel = ContactViewModel()
    let realm = try! Realm()
  

    // MARK: View Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let persons = realm.objects(User.self)
        let loggedUser = persons[0] as User
        
        self.navigationController!.navigationBar.tintColor = UIColor.orangeColor();
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.scopeButtonTitles = ["All", "Employees", "Intern"]
        searchController.searchBar.delegate = self
        
            contactModel.displayPeople { (people) in
            self.people = people
            self.tableView.reloadData()
        
        
            self.profileUser = people.filter { nearsoftian in
                            return nearsoftian.email == loggedUser.email
                        }.first!
            
            try! self.realm.write {
                self.realm.add(self.profileUser, update: true)
            }
        }
        
        
        
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
        cell?.userName.text = person.fullName
        cell?.email.text = person.email
        if person.profilePic == ""{
            cell?.profilePic.image = UIImage(named: "nearsoft-symbol")
        } else {
            cell?.profilePic.af_setImageWithURL(profilePicURL!)
        }
        
        

        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    }
    
   
}