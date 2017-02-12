//
//  AppDelegate.swift
//  SwiftMergeSort
//
//  Created by Lam Le Van on 2/12/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
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

