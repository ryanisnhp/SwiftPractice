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
        
        let server = BackupServer.server
        
        let queue = dispatch_queue_create("workQueue", DISPATCH_QUEUE_CONCURRENT)
        let group = dispatch_group_create()
        for _ in 0..<100 {
            dispatch_group_async(group, queue, { () -> Void in
                BackupServer.server.backup(DataItem(type: DataItem.ItemType.Email, data: "bob@example.com"))
            })
        }
        dispatch_group_wait(group, DISPATCH_TIME_FOREVER) // Wait group finish
        print("\(server.getData().count) items were backed up");
        
//        
//        server.backup(DataItem(type: DataItem.ItemType.Email, data: "joe@example.com"))
//        server.backup(DataItem(type: DataItem.ItemType.Phone, data: "555-123-1133"))
//        globalLogger.log("Back up 2 items to \(server.name)")
//        
//        let otherServer = BackupServer.server
//        otherServer.backup(DataItem(type: DataItem.ItemType.Email, data: "bob@example.com"))
//        globalLogger.log("Back up 1 item to \(otherServer.name)")
        
        globalLogger.printLog()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
