//
//  Pool.swift
//  DemoPattern
//
//  Created by Lam Le Van on 7/24/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation

class Pool<T> {
    
    private var data = [T]()
    //Protecting data array
    private let arrayQ = dispatch_queue_create("arrayQ", DISPATCH_QUEUE_SERIAL)
    private let semaphore: dispatch_semaphore_t
    
    init(items: [T]) {
        data.reserveCapacity(data.count)
        for item in items {
            data.append(item)
        }
        semaphore = dispatch_semaphore_create(items.count)
    }
    
//    func getFromPool() -> T? {
//        var result: T?
//        if data.count > 0 { //Must ensure objects are available to be checked out(currently not ensure)
//            dispatch_sync(arrayQ, { () -> Void in
//                result = self.data.removeAtIndex(0)
//            })
//        }
//        return result
//    }
    
    func getFromPool() -> T? {
        var result: T?
        if dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER) == 0 { // dispatch_semaphore_create xac nhan mot gia tri Int de khoi tao value cua bo dem, bo den duoc gaim moi lan dispatch_semaphore_wait duoc goi. Khi bo dem giam ve 0, goi dispatch_semaphore_wait trong getFromPool, ta giam bo dem moi lan mot doi tuong dc remove tu mang du lieu va khien cho goi phuong thuc den block nhieu doi tuong hon trong mang duoc cho
            dispatch_sync(arrayQ, { () -> Void in
                result = self.data.removeAtIndex(0)
            })
        }
        return result
    }
    
    func returnToPool(item: T) {
        dispatch_sync(arrayQ) { () -> Void in
            self.data.append(item)
            dispatch_semaphore_signal(self.semaphore)
        }
    }
}