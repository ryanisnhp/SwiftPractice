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
    var stock: Int 
    
    
    init(name: String, description: String, price: Double, stock: Int) {
        self.name = name;
        self.description = description;
        self.price = price;
        self.stock = stock;
    }
}