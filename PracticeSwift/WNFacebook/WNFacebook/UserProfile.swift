//
//  UserProfile.swift
//  WNFacebook
//
//  Created by Lam Le Van on 9/5/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class UserProfile {
    
    private var accessToken = ""
    private var userID = ""
    private var facebookProfileUrl = ""
    private var resultUser: [String: String] = [:]
    
    static var permisson: [String] {
        return ["public_profile", "email", "user_friends"]
    }
    
    class var sharedInstance: UserProfile {
        struct Wrapper {
            static let singleton = UserProfile()
        }
        return Wrapper.singleton
    }
    
    enum User {
        
        case Profile
        case Email
        case Friends
        
        var value: String {
            return UserProfile.permisson[self.hashValue]
        }

    }
    
    init() {
    }

    var userName: String? {

        return nil
    }
    
    var userEmail: String? {
        if let userEmail = resultUser["email"] {
            return userEmail
        }
        return nil
    }
    
    var avatar: UIImage? {

        return nil
    }
    
    func returnData(completion: (Optional<String>,Optional<UIImage>) -> Void) {
        let graphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler { (connection, result, error) -> Void in
            if error != nil {
                print(error.localizedDescription)
            } else {
                var userName: String?
                var avatar: UIImage?
                self.accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                if let result = result as? [String: String] {
                    self.resultUser = result
                }
                if let userID = result.valueForKey("id") as? String {
                    self.userID = userID
                    self.facebookProfileUrl = "http://graph.facebook.com/\(userID)/picture?type=large"
                    if let url = NSURL(string: self.facebookProfileUrl), data = NSData(contentsOfURL: url) {
                        avatar = UIImage(data: data)
                    }
                    userName = self.resultUser["name"]
                }
                completion(userName, avatar)
            }
        }
    }
}