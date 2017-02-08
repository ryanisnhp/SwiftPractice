//
//  ChainOfResponsibilityPattern.swift
//  BehaviorPattern
//
//  Created by Lam Le Van on 2/9/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import Foundation

class Logger {
    static var error = 1
    static var info = 2
    static var debug = 3
    
    var mask: Int?
    var next: Logger?
    
    func nextHandle(nextLogger: Logger) -> Logger? {
        next = nextLogger
        return next
    }
    
    func message(message: String, priority: Int) {
        if priority <= mask! {
            writeMessage(message: message)
            if let next = next {
                next.message(message: message, priority: priority)
            }
        }
    }
    
    func writeMessage(message: String) {
        preconditionFailure("Must be overriden")
    }
    
    class func prepareDefaultChain() -> Logger? {
        var l: Logger?
        var l1: Logger?
        var l2: Logger?
        l = StdOutLogger(mask: Logger.debug)
        l1 = l?.nextHandle(nextLogger: EmailLogger(mask: Logger.info))
        l2 = l1?.nextHandle(nextLogger: EmailLogger(mask: Logger.error))
        return l
    }
}

class StdOutLogger: Logger {
    init(mask: Int) {
        super.init()
        self.mask = mask
    }
    
    override func writeMessage(message: String) {
        print("Sending to StdOutLogger: \(message)")

    }
}

class EmailLogger: Logger {
    init(mask: Int) {
        super.init()
        self.mask = mask
    }
    
    override func writeMessage(message: String) {
        print("Sending to EmailLogger: \(message)")
    }
}
