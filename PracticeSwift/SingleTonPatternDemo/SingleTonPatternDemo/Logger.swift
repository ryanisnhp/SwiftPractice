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
    private init() {
        
    }
    
    func log(msg: String) {
        data.append(msg)
    }
    
    func printLog() {
        for msg in data {
            print("Log: \(msg)")
        }
    }
}