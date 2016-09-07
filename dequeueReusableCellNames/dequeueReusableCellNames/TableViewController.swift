//
//  ViewController.swift
//  dequeueReusableCellNames
//
//  Created by Héctor Moreno on 01/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell{
    @IBOutlet var tittleLabel: UILabel!
    
    func configureCellTittle(tittle: String) {
        tittleLabel.text = tittle
        
        func prepareForReuse() {
            super.prepareForReuse()
            tittleLabel.text = nil
        }
    }

}

class TableViewController: UITableViewController {
    
    let names = ["Marhta", "Bianca", "Saul", "Héctor", "Lourdes", "Pedro", "Gustavo", "Zulema", "Juan", "Gaston", "Ana", "Tomas", "Alberto", "Iván", "Abraham", "Daniel", "Patricia", "Cesar", "Darío", "Carlos"]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellId") as! TableViewCell
        
        if indexPath.row % 2 == 0{
            let tittleText = names[indexPath.row]
            cell.configureCellTittle(tittleText)
            
        }
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }



}

