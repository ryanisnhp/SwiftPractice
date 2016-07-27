//
//  Book.swift
//  DemoPattern
//
//  Created by Lam Le Van on 7/24/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation

class Book {
    
    let author: String
    let title: String
    let stockNumber: Int
    var reader: String?
    var checkoutCount = 0
    
    init(author: String, title: String, stock: Int) {
        self.author = author
        self.title = title
        self.stockNumber = stock
    }
}