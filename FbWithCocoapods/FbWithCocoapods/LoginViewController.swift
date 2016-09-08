//
//  ViewController.swift
//  FbWithCocoapods
//
//  Created by Héctor Moreno on 08/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import RealmSwift

class LoginViewController: UIViewController {
    
    let loginManager = FBSDKLoginManager()
    var imageView : UIImageView!
    var logStateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(frame: CGRectMake(0, 0, 100, 100))
        imageView.center = CGPoint(x: view.center.x, y: 200)
        imageView.image = UIImage(named: "fb-art.jpg")
        view.addSubview(imageView)
        
        logStateLabel = UILabel(frame: CGRectMake(0,0,200,30))
        logStateLabel.center = CGPoint(x: view.center.x, y: 300)
        logStateLabel.text = "Not Logged In"
        logStateLabel.textAlignment = NSTextAlignment.Center
        view.addSubview(logStateLabel)
    
        let btnSize : CGFloat = 100
        let btnLogin = UIButton(frame: CGRectMake(0,0,btnSize,btnSize))
        btnLogin.center = CGPoint(x: view.center.x, y: 500)
        btnLogin.setImage(UIImage(named: "fb-art"), forState: UIControlState.Normal)
        btnLogin.addTarget(self, action: #selector(btnLoginPressed), forControlEvents: UIControlEvents.TouchUpInside)
        
        //Circular button
        btnLogin.layer.cornerRadius = btnSize/2
        btnLogin.layer.masksToBounds = true
        btnLogin.layer.borderColor = UIColor.blackColor().CGColor
        btnLogin.layer.borderWidth = 2
        
        view.addSubview(btnLogin)
    
    }
    
    func btnLoginPressed() {
        loginManager.logInWithReadPermissions(["public_profile", "email"], fromViewController: self, handler: { (response:FBSDKLoginManagerLoginResult!, error: NSError!) in
            if(error == nil) {
                print("No Error")
                self.getFacebookUserInfo()
                
            }
            })
    }
    
    func getFacebookUserInfo() {
        let user = Person()
        let realm = try! Realm()
        
        if(FBSDKAccessToken.currentAccessToken() != nil) {
            //print permissions, such as public_profile
            print("\(FBSDKAccessToken.currentAccessToken().permissions)")
            let graphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields" : "id, name, email"])
            graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
                
                self.logStateLabel.text = result.valueForKey("name") as? String
                
                if let FbID = result.valueForKey("id") as? String{
                        user.FbID = FbID
                }
                
                if let newName = result.valueForKey("name") as? String {
                       user.name = newName
                }
                
                if let newEmail = result.valueForKey("email") as? String {
                    user.email = newEmail
                }
  
                try! realm.write {
                     realm.add(user, update: true)
                }
                
                
                self.loginManager.logOut() // this is an instance function
                print(realm.configuration.fileURL)
                
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                appDelegate.switchviewController()
                
                
            })
        }
    }
}



