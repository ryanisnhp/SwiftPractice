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
import FirebaseAuth

let uiRealm = try! Realm()
struct User {
    static let email = "vanlam1503@gmail.com"
    static let password = "levanlam!%)#1990"
}
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        if let window = window {
            window.backgroundColor = UIColor.whiteColor()
            window.rootViewController = UINavigationController(rootViewController: ViewController())
            window.makeKeyAndVisible()
        }
        self.configFirebase()
        return true
    }
    
    func configFirebase() {
        FIRApp.configure()
        fatalError()
    }
}
