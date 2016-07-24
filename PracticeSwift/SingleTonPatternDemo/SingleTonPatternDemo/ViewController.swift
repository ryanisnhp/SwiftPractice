//
//  ViewController.swift
//  SingleTonPatternDemo
//
//  Created by Lam Le Van on 7/23/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tesing = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let server = BackupServer(name: "Server#1")
//        server.backup(DataItem(type: DataItem.ItemType.Phone, data: "joe@example.com"))
//        server.backup(DataItem(type: DataItem.ItemType.Email, data: "424-34-43434"))
//        
//        let otherServer = BackupServer(name: "Server#2")
//        otherServer.backup(DataItem(type: DataItem.ItemType.Email, data: "bob@example.com"))
//        globalLogger.log("Backed up 2 items to \(server.name)")
//        globalLogger.log("Backed up 1 item to \(otherServer.name)")
//        globalLogger.printLog()
        
        //Single ton on multithread
        let server = BackupServer.server
        let queue = dispatch_queue_create("workQueue", DISPATCH_QUEUE_CONCURRENT)
        let group = dispatch_group_create()
        
        for _ in 0..<100 {
            dispatch_group_async(group, queue, { () -> Void in
                self.tesing = self.tesing + 1
                print(self.tesing)
                BackupServer.server.backup(DataItem(type: DataItem.ItemType.Email, data: "bob@example.com"))
            })
        }
        dispatch_group_wait(group, DISPATCH_TIME_FOREVER)
        print("\(server.getData().count) items were backed up")
        
        self.navigationController?.pushViewController(TestingViewController(), animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

class TestingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let view = UIView(frame: UIScreen.mainScreen().bounds)
        view.backgroundColor = UIColor.redColor()
        self.view.addSubview(view)
    }
}
