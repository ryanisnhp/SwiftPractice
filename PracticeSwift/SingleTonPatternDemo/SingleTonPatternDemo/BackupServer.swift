//
//  BackupServer.swift
//  SingleTonPatternDemo
//
//  Created by Lam Le Van on 7/23/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation

class DataItem {
    
    enum ItemType: String {
        case Email = "Email Address"
        case Phone = "Telephone Number"
        case Card = "Credit Card Number"
    }
    
    var type: ItemType
    var data: String
    
    init(type: ItemType, data: String) {
        self.type = type
        self.data = data
    }
}

class BackupServer {
    
    let name: String
    private var data: [DataItem] = []
    
    init(name: String) {
        self.name = name
        globalLogger.log("Created new server \(name)")
    }
    
    func backup(item: DataItem) {
        data.append(item)
        globalLogger.log("\(name) backed up item of type \(item.type.rawValue)")
    }
    
    func getData() -> [DataItem] {
        return data
    }
}