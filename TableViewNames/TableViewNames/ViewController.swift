//
//  ViewController.swift
//  TableViewNames
//
//  Created by Héctor Moreno on 01/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var information: [Person] = []
    


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        createObjects()
        
        
    }
    
    func createObjects()  {
    
        let martha = Person(firstName: "Martha", lastName: "quijada", email: "mquijada@gmail.com")
        let juan = Person(firstName: "Juan", lastName: "Moreno", email: "juna@gmail.com")
        let hector = Person(firstName: "Héctor", lastName: "Moreno", email: "hkmoca@gmail.com")
        let pedro = Person(firstName: "Pedro", lastName: "Verde", email: "pverde@gmail.com")
        let gaston = Person(firstName: "Gaston", lastName: "Perez", email: "gperez@gmail.com")
        
        information.append(martha)
        information.append(juan)
        information.append(hector)
        information.append(pedro)
        information.append(gaston)
    
    }
    
    //MARK: - Privayte
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detail" {
            
            let secondVC = segue.destinationViewController as! SecondViewController
            let path = tableView.indexPathForSelectedRow
            
            secondVC.person = information[path!.row]
        }
    }
    
}

//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate{
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("detail", sender: nil)
    }
    
}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return information.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = information[indexPath.row].firstName
        //cell.detailTextLabel?.text = "sup putit"
        return cell
        
    }
    
    
    


}

