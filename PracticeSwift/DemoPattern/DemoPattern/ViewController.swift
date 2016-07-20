//
//  ViewController.swift
//  DemoPattern
//
//  Created by Lam Le Van on 7/16/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var products: [Product] = [
        Product(name: "Kayak", description: "A boat for one person",
            price: 275, stock: 10),
        Product(name: "Lifejacket", description: "Protective and fashionable",
            price: 48.95, stock: 14),
        Product(name: "Soccer Ball", description: "FIFA-approved size and weight",
            price: 19.5, stock: 32)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(calculateTax(products[0]))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateTax(product: Product) -> Double {
        return product.price * 0.2
    }
    
    func calculateStockValue(tuples: [Product]) -> Double {
        return tuples.reduce(0, combine: { (total, product) -> Double in
            return total + (product.price * Double(product.stock))
        })
    }
}
