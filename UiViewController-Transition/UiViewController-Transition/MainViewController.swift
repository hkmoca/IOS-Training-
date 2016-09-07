//
//  ViewController.swift
//  UiViewController-Transition
//
//  Created by Héctor Moreno on 06/09/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toSecondStoryBoard(sender: AnyObject) {
    
        //presentViewController( UIStoryboard(name: "Second", bundle: nil).instantiateViewControllerWithIdentifier("Second") as UIViewController, animated: true, completion: nil)
        

    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        initialViewController  = MainViewController(nibName:"MainViewController",bundle:nil)
        
        let frame = UIScreen.mainScreen().bounds
        window = UIWindow(frame: frame)
        
        window!.rootViewController = initialViewController
        window!.makeKeyAndVisible()
        
        return true
    }

}

