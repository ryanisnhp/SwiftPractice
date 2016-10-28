//
//  RestAPIManager.swift
//  RestFulDemo
//
//  Created by Lam Le Van on 6/2/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation
import SwiftyJSON

typealias ServiceResponse = (JSON, NSError?) -> Void

class RestAPIManager: NSObject {
    
    static var sharedInstance = RestAPIManager()
    static let baseURL = "http://api.randomuser.me/"

    
    func getRandomUser(onCompletion: (JSON) -> Void) {
        let url = RestAPIManager.baseURL
        self.makeHTTPRequest(url, onCompletion: {json, error in
            onCompletion(json)
        })
    }
    
    private func makeHTTPRequest(path: String, onCompletion: ServiceResponse) {
        if let url = NSURL(string: path) {
            let request = NSMutableURLRequest(URL: url)
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
                if let jsonData = data {
                    let json = JSON(data: jsonData)
                    onCompletion(json, error)
                } else {
                    onCompletion(nil, error)
                }
            })
            task.resume()
        }
    }
    
    private func makeHTTPPOstRequest(path: String, body: [String: AnyObject], onCompletion: ServiceResponse) {
        if let url = NSURL(string: path) {
            let request = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            do {
                let jsonBody = try NSJSONSerialization.dataWithJSONObject(body, options: .PrettyPrinted)
                request.HTTPBody = jsonBody
                let session = NSURLSession.sharedSession()
                let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
                    if let jsonData = data {
                        let json = JSON(data: jsonData)
                        onCompletion(json, error)
                    } else {
                        onCompletion(nil, error)
                    }
                })
                task.resume()
            } catch {
                onCompletion(nil, nil)
            }
        }
    }
}