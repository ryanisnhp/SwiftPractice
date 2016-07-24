//
//  ViewController.swift
//  DemoPattern
//
//  Created by Lam Le Van on 7/23/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet private weak var totalStockLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
//    var handler = (T) -> Void
    //    let logger = Logger<Product>(callback: handler)
    var products = [Product(name: "Kayak", description: "A boat for one person", category: "Watersports", price: 275.0, stockLevel: 10)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Action method
    @IBAction func stockLevelDidChange(sender: AnyObject) {
        if var currentCell = sender as? UIView {
            while (true) {
                currentCell = currentCell.superview!
                if let cell = currentCell as? ProductTableCell {
                    if let product = cell.product {
                        if let stepper = sender as? UIStepper {
                            product.stockLevel = Int(stepper.value)
                        } else if let textField = sender as? UITextField {
                            if let newValue = textField.text!.toInt() {
                                product.stockLevel = newValue
                            }
                        }
                        cell.stockStepper.value = Double(product.stockLevel)
                        cell.stockField.text = String(product.stockLevel)
                        productLogger.logItem(product)
                    }
                    break
                }
            }
            displayStockTotal()
        }
    }
    
    private func displayStockTotal() {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension String {
    func toInt() -> Int? {
        return Int(self)
    }
}
