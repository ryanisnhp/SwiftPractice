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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FIRApp.configure()
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            window.backgroundColor = UIColor.white
            window.rootViewController = UINavigationController(rootViewController: ViewController())
            window.makeKeyAndVisible()
        }
        return true
    }
}
