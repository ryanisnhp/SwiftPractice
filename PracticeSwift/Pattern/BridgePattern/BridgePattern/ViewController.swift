//
//  ViewController.swift
//  BridgePattern
//
//  Created by Le Van Lam on 7/27/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let coms = Communicator(channel: Channel.Channels.Satellite)
        coms.sendCleartextMessage("Hello")
        coms.sendSecureMessage("This is a secret")
        coms.sendPriorityMessage("This is important")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

