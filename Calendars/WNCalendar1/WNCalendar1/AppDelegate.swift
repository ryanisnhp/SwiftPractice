//
//  AppDelegate.swift
//  WNCalendar1
//
//  Created by Lam Le Van on 8/30/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        if let window = window {
            window.backgroundColor = UIColor.whiteColor()
            window.rootViewController = ViewController()
            window.makeKeyAndVisible()
        }
        return true
    }
}

