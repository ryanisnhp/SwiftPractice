//
//  UserInfo.swift
//  RestFulDemo
//
//  Created by Lam Le Van on 6/2/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserInfo: NSObject {
    
    private var pictureURL: String
    private var username: String
    
    init(json: JSON) {
        pictureURL = json["picture"]["medium"].stringValue
        username = json["login"]["username"].stringValue
    }
    
    func getPicture() -> UIImage {
        if let url = NSURL(string: self.pictureURL), let data = NSData(contentsOfURL: url)  {
            return UIImage(data: data)!
        }
        
        return UIImage()
    }
    
    func getUsername() -> String {
        return username
    }
}