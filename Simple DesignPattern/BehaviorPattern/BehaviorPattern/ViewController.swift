//
//  ViewController.swift
//  BehaviorPattern
//
//  Created by Lam Le Van on 2/5/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        useStatePattern()
        useChainOfResponse()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func useStatePattern() {
        let standbyMode = StandByState()
        let player = AudioPlayer(state: standbyMode)
        
        player.actionButton()
        player.sourceButton()
        
        player.actionButton()
        player.sourceButton()
        
        player.actionButton()
        player.actionButton()
        player.sourceButton()
    }
    
    private func useChainOfResponse() {
        let l = Logger.prepareDefaultChain()
        l?.message(message: "Entering the func Y()", priority: Logger.debug)
        
        l?.message(message: "Step 1 Completed", priority: Logger.info)
        
        l?.message(message: "An error occured", priority: Logger.error)
    }
}

class User {
    var name: String {
        set {
            UserDefaults.standard.set(newValue, forKey: "name")
            UserDefaults.standard.synchronize()
        }
        get {
            if let name = UserDefaults.standard.value(forKey: "name") as? String {
                return name
            }
            return ""
        }
    }
    
    var isAvailable: Bool {
        return name.characters.count > 0
    }
}


