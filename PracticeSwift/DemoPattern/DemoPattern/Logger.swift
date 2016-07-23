//
//  Logger.swift
//  DemoPattern
//
//  Created by Lam Le Van on 7/23/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation

class Logger<T where T: NSObject, T: NSCopying> {
    var dataItems: [T] = []
    var callback: (T) -> Void
    
    init(callback: T -> Void) {
        self.callback = callback
    }
    
    func logItem(item: T) {
        if let item = item.copy() as? T {
            dataItems.append(item)
        }
        callback(item)
    }
    
    func processItems(callback: T -> Void) {
        for item in dataItems {
            callback(item)
        }
    }
    
    func testing() {
        processItems { (iems) -> Void in
            <#code#>
        }
    }
}