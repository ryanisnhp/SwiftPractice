//
//  AppDelegate.swift
//  MVVMDemo1
//
//  Created by LeVanLam on 2/15/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        configWindow()
        return true
    }
    
    private func configWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            window.rootViewController = ViewController()
            window.makeKeyAndVisible()
        }
    }

}

