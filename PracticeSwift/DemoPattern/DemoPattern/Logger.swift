//
//  Logger.swift
//  DemoPattern
//
//  Created by Lam Le Van on 7/23/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation

let productLogger = Logger<Product>(callback: { p in
    print("Change: \(p.name) \(p.stockLevel) items in stock)")
})

final class Logger<T where T: NSObject, T: NSCopying> {
    
    var dataItems: [T] = []
    var callback: (T) -> Void
    //Protect array
    var arrayQ = dispatch_queue_create("arrayQ", DISPATCH_QUEUE_CONCURRENT)
    //Protect callback
    var callbackQ = dispatch_queue_create("callbackQ", DISPATCH_QUEUE_SERIAL)
    
    private init(callback: T -> Void, protect: Bool = true) {
        self.callback = callback
        if protect {
            self.callback = {(item: T) in
                dispatch_sync(self.callbackQ, { () -> Void in
                    callback(item)
                })
            }
        }
    }
    
    func logItem(item: T) {
        dispatch_barrier_async(arrayQ) { () -> Void in
            if let item = item.copy() as? T {
                self.dataItems.append(item)
            }
            self.callback(item)
        }
    }
    
    func processItems(callback: T -> Void) {
        dispatch_sync(arrayQ) { () -> Void in
            for item in self.dataItems {
                callback(item)
            }
        }
    }
    
}