//
//  ViewController.swift
//  WNFacebook
//
//  Created by Lam Le Van on 9/4/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {

    @IBOutlet private weak var loginButton: FBSDKLoginButton!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.readPermissions = UserProfile.permisson
        loginButton.delegate = self
        self.getUserFacebook()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func getUserFacebook() {
        let userProfile = UserProfile.sharedInstance
        userProfile.getFacebookData { (accessToken, userProfile) -> Void in
            print(accessToken)
            print(userProfile?.email)
            print(userProfile?.userName)
            self.userName.text = userProfile?.userName
            self.userImage.image = userProfile?.avatar
        }
    }
}

extension ViewController: FBSDKLoginButtonDelegate {
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged in")
        if error != nil {
            //Process error
        } else if result.isCancelled {
            //Handle cancelations
        } else {
            if result.grantedPermissions.contains("email") {
                self.getUserFacebook()
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        self.getUserFacebook()
    }
    
}
