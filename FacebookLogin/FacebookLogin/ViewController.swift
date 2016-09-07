//
//  ViewController.swift
//  FacebookLogin
//
//  Created by Héctor Moreno on 04/08/16.
//  Copyright © 2016 Hkapp. All rights reserved.
//

import UIKit
import FBSDKLoginKit


class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    var imageView: UIImageView!
    var label: UILabel!
    var keyLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(frame: CGRectMake(0, 0, 100, 100))
        imageView.center = CGPoint(x: view.center.x, y: 200)
        imageView.image = UIImage(named: "fb-art")
        view.addSubview(imageView)
        
        label = UILabel(frame: CGRectMake(0, 0, 200, 30))
        label.center = CGPoint(x: view.center.x, y: 300)
        label.text = "Not Logged In"
        label.textAlignment = NSTextAlignment.Center
        view.addSubview(label)
        
        keyLabel = UILabel(frame: CGRectMake(0, 0, 2000, 30))
        keyLabel.center = CGPoint(x: view.center.x, y: 350)
        keyLabel.text = "Your Fb Token"
        keyLabel.textAlignment = NSTextAlignment.Center
        view.addSubview(keyLabel)
        
        

//        let loginButton = FBSDKLoginButton()
//        loginButton.center = CGPoint(x: view.center.x, y: 400)
//        loginButton.delegate = self
//        self.view.addSubview(loginButton)
        
        
        let btnSize: CGFloat = 100
        let btnLogin = UIButton(frame: CGRectMake(0, 0, btnSize, btnSize))
        btnLogin.center = CGPoint(x: view.center.x, y: 500)
        btnLogin.setImage(UIImage (named: "fb-art"), forState: UIControlState.Normal)
        btnLogin.addTarget(self, action: #selector(btnLoginPressed), forControlEvents: UIControlEvents.TouchUpInside)
        
        btnLogin.layer.cornerRadius = btnSize/2
        btnLogin.layer.masksToBounds = true
        btnLogin.layer.borderColor = UIColor.blackColor().CGColor
        btnLogin.layer.borderWidth = 2
        
        view.addSubview(btnLogin)
        
        getFacebookUserInfo()
        
        
    }
    
    
    func btnLoginPressed() {
        let loginManner = FBSDKLoginManager()
        loginManner.logInWithReadPermissions( ["public_profile"], fromViewController: self, handler: {(response: FBSDKLoginManagerLoginResult!, NSError) in
            if (NSError == nil) {
                print("No Error")
                self.getFacebookUserInfo()
            }
            })
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!)  {
        print("didCompleteWithResult")
        print(FBSDKAccessToken.currentAccessToken())
        
        getFacebookUserInfo()
        
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("loginButtonDidLogOut")
        imageView.image = UIImage(named: "fb-art")
        label.text = "Not logged In"
        keyLabel.text = "Your Fb Token"
    }
    
    func getFacebookUserInfo(){
        if (FBSDKAccessToken.currentAccessToken() != nil) {
            print(FBSDKAccessToken.currentAccessToken().permissions)
            let graphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields" : "id, name, email"])
            graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
                self.label.text = result.valueForKey("name") as? String
                self.keyLabel.text = "\(FBSDKAccessToken.currentAccessToken())"
                let FBid = result.valueForKey("id") as? String
                let url = NSURL(string: "https://graph.facebook.com/\(FBid!)/picture?type=large&return_ssl_resources=1")
                self.imageView.image = UIImage(data: NSData(contentsOfURL: url!)!)
            })
            
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

