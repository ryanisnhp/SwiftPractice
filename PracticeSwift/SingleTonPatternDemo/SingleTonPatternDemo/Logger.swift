//
//  Logger.swift
//  SingleTonPatternDemo
//
//  Created by Lam Le Van on 7/23/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation


//Quick
let globalLogger = Logger()

final class Logger {
    
    private var data: [String] = []
    private let arrayQ = dispatch_queue_create("arrayQ", DISPATCH_QUEUE_SERIAL)
    private init() {
        
    }
    
    func log(msg: String) {
        dispatch_sync(arrayQ) { () -> Void in
            self.data.append(msg)
        }
    }
    
    func printLog() {
        for msg in data {
            print("Log: \(msg)")
        }
    }
}