//
//  AppDelegate.swift
//  RealmStarted
//
//  Created by Lam Le Van on 8/11/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit
import Firebase
import RealmSwift

let uiRealm = try! Realm()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        FIRApp.configure()
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        if let window = window {
            window.backgroundColor = UIColor.whiteColor()
            window.rootViewController = UINavigationController(rootViewController: ViewController())
            window.makeKeyAndVisible()
        }
        return true
    }
}
