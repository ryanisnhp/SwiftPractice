//
//  Producy.swift
//  DemoPattern
//
//  Created by Lam Le Van on 7/16/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation

class Product: NSObject, NSCopying {
    
    private(set) var name: String
    private(set) var productDescription: String
    private(set) var category: String
    private var stockLevelBackingValue: Int = 0
    private var priceBackingValue: Double = 0
    
    init(name :String, description: String, category: String, price: Double, stockLevel:Int) {
        self.name = name
        self.productDescription = description
        self.category = category
        super.init()
        self.price = price
        self.stockLevel = stockLevel
    }
    
    func calculateTax(rate: Double) -> Double {
        return min(10, self.price * rate)
    }
    
    var stockLevel: Int {
        get {
            return stockLevelBackingValue
        }
        set {
            stockLevelBackingValue = max(0, newValue)
        }
    }
    
    private(set) var price: Double {
        get {
            return priceBackingValue
        }
        set {
            priceBackingValue = max(1, newValue)
        }
    }
    
    var stockValue: Double {
        get {
            return self.price * Double(self.stockLevel)
        }
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        return Product(name: self.name, description: self.description, category: self.category, price: self.price, stockLevel: Int(self.stockValue))
    }
}