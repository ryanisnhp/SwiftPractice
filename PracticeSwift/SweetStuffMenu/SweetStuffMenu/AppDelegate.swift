//
//  AppDelegate.swift
//  SweetStuffMenu
//
//  Created by Lam Le Van on 9/17/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        initializeWindow()
        return true
    }
    
    private func initializeWindow() {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        if let window = window {
            window.backgroundColor = UIColor.whiteColor()
            window.rootViewController = ViewController()
            window.makeKeyAndVisible()
        }
    }
}

