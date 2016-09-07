//
//  SecondVC.swift
//  UiViewController-Transition
//
//  Created by Héctor Moreno on 06/09/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import Foundation
import UIKit

class SecondVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toFisrtStoryBoard(sender: AnyObject) {
        
        // change to first view controller
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.switchBack()
    }
    
}

