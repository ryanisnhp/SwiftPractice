//
//  UserProfile.swift
//  WNFacebook
//
//  Created by Lam Le Van on 9/5/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit
import FBSDKLoginKit

struct Handle<T> {
    typealias HandleComletion = (T) -> Void
}

class UserProfile {
    
    class var sharedInstance: UserProfile {
        struct Wrapper {
            static let singleton = UserProfile()
        }
        return Wrapper.singleton
    }
    
    var userName: String?
    var email: String?
    var avatar: UIImage?
    
    static var permisson: [String] {
        return ["public_profile", "email", "user_friends"]
    }
    
    private var parameters: [NSObject : AnyObject] {
        return ["fields": "email, name"]
    }
    
    func getFacebookData(completion: Handle<(accessToken: String?, userProfile: UserProfile?)>.HandleComletion) {
        self.makeData { (accessToken, myResult, error) -> Void in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                let concurentQueue = dispatch_queue_create("concurent_queue", DISPATCH_QUEUE_CONCURRENT)
                dispatch_async(concurentQueue, { () -> Void in
                    let userProfile = UserProfile.sharedInstance
                    if let myResult = myResult {
                        userProfile.userName = myResult["name"]
                        userProfile.email = myResult["email"]
                        if let userID = myResult["id"] {
                            let facebookProfileUrl = "http://graph.facebook.com/\(userID)/picture?type=large"
                            if let url = NSURL(string: facebookProfileUrl), data = NSData(contentsOfURL: url) {
                                userProfile.avatar = UIImage(data: data)
                            }
                        }
                    }
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        completion((accessToken, userProfile))
                    })
                })
            }
        }
    }
    
    private func makeData(completion: Handle<(String?, [String: String]?, NSError?)>.HandleComletion) {
        let graphRequest = FBSDKGraphRequest(graphPath: "me", parameters: parameters)
        graphRequest.startWithCompletionHandler { (connection, result, error) -> Void in
            if error != nil {
                completion((nil, nil, error))
            } else {
                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                var myResult: [String: String] = [:]
                if let result = result as? [String: String] {
                    myResult = result
                }
                completion((accessToken, myResult, nil))
            }
        }
    }
}