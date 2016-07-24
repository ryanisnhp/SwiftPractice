//
//  ViewController.swift
//  SingleTonPatternDemo
//
//  Created by Lam Le Van on 7/23/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let server = BackupServer(name: "Server#1")
        server.backup(DataItem(type: DataItem.ItemType.Phone, data: "joe@example.com"))
        server.backup(DataItem(type: DataItem.ItemType.Email, data: "424-34-43434"))
        
        let otherServer = BackupServer(name: "Server#2")
        otherServer.backup(DataItem(type: DataItem.ItemType.Email, data: "bob@example.com"))
        globalLogger.log("Backed up 2 items to \(server.name)")
        globalLogger.log("Backed up 1 item to \(otherServer.name)")
        globalLogger.printLog()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
