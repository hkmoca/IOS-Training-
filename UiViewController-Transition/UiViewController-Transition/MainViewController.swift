//
//  ViewController.swift
//  UiViewController-Transition
//
//  Created by Héctor Moreno on 06/09/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var window: UIWindow?
    var initialViewController :UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toSecondStoryBoard(sender: AnyObject) {
    
        // switch root view controllers in AppDelegate
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.switchViewControllers()
        

    }
    
   
    

}

