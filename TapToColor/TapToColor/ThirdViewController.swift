//
//  ThirdViewController.swift
//  TapToColor
//
//  Created by Héctor Moreno on 03/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dissmissButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
   
    
}