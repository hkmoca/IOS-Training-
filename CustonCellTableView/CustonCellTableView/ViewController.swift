//
//  ViewController.swift
//  CustonCellTableView
//
//  Created by Héctor Moreno on 04/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var persons: [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        createObjects()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func createObjects() {
        
        let martha = Person(firstName: "Martha", lastName: "Quijada", email: "mquijada@gmail.com", profileImage: UIImage(named: "martha")!)
        let juan = Person(firstName: "Juan", lastName: "Moreno", email: "juna@gmail.com", profileImage: UIImage(named: "juan")!)
        let hector = Person(firstName: "Héctor", lastName: "Moreno", email: "hkmoca@gmail.com", profileImage: UIImage(named: "obama")!)
        let pedro = Person(firstName: "Pedro", lastName: "Verde", email: "pverde@gmail.com", profileImage: UIImage(named: "pedro")!)
        let laura = Person(firstName: "Laura", lastName: "Perez", email: "gperez@gmail.com", profileImage: UIImage(named: "laura")!)
        
        persons.append(martha)
        persons.append(juan)
        persons.append(hector)
        persons.append(pedro)
        persons.append(laura)
        
        tableView.reloadData()
    
    }

}

extension ViewController: UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustonCell
        cell.name.text = persons[indexPath.row].fullName
        cell.email.text = persons[indexPath.row].email
        cell.profileImage.image = persons[indexPath.row].profileImage
        return cell
    }
    
}