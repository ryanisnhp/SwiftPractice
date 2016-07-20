//
//  Producy.swift
//  DemoPattern
//
//  Created by Lam Le Van on 7/16/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation

class Product {
    
    var name: String
    var description: String
    var price: Double
    private var stockBackingValue: Int = 0
    var stock: Int {
        get {
        return stockBackingValue;
        }
        set {
        stockBackingValue = max(0, newValue)
        }
    }
    
    init(name: String, description: String, price: Double, stock: Int) {
        self.name = name;
        self.description = description;
        self.price = price;
        self.stock = stock;
    }
    
    func calculateTax(rate: Double) -> Double {
        return min(10, self.price * rate)
    }
    
    var stockValue: Double {
        get {
            return self.price * Double(self.stock)
        }
    }
}