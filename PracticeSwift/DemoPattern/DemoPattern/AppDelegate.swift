//
//  AppDelegate.swift
//  DemoPattern
//
//  Created by Lam Le Van on 7/16/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        if let window = window {
            window.backgroundColor = UIColor.whiteColor()
            window.rootViewController = HomeViewController()
            window.makeKeyAndVisible()
        }
        return true
    }


}

