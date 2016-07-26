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
    var productStore = ProductDataStore()
//    var handler = (T) -> Void
    //    let logger = Logger<Product>(callback: handler)
    var products = [Product(name: "Kayak", description: "A boat for one person", category: "Watersports", price: 275.0, stockLevel: 10)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let queue = dispatch_queue_create("workQ", DISPATCH_QUEUE_CONCURRENT)
        let group = dispatch_group_create()
        
        print("Starting")
        for i in 1...20 {
            dispatch_group_async(group, queue, { () -> Void in
                let book = Library.checkoutBook("#reader#\(i)")
                if book != nil {
                    NSThread.sleepForTimeInterval(Double(rand() % 2))
                    Library.returnBook(book!)
                }
            })
        }
        dispatch_group_wait(group, DISPATCH_TIME_FOREVER)
        print("All blocks complete")
        Library.printReport()
        
        //Register
        self.tableView.registerClass(ProductTableCell.self, forCellReuseIdentifier: "ProductTableVell")
        
        productStore.callback = {(p: Product) in
            for cell in self.tableView.visibleCells {
                if let pcell = cell as? ProductTableCell {
                    if pcell.product?.name == p.name {
                        pcell.stockStepper.value = Double(p.stockLevel)
                        pcell.stockField.text = String(p.stockLevel)
                    }
                }
            }
            self.displayStockTotal()
        }
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
        let finalTotals: (Int, Double) = productStore.products.reduce((0, 0.0)) { (total, product) -> (Int, Double) in
            return (
                total.0 + product.stockLevel,
                total.1 + product.stockValue
            )
        }
        totalStockLabel.text = "\(finalTotals.0) Products in Stock" + "TotalValue: \(Utils.currencyStringFromNumber(finalTotals.1))"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productStore.products.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("ProductTableCell") as? ProductTableCell {
            let product = productStore.products[indexPath.row]
            cell.product = product
            cell.nameLabel.text = product.name
            cell.descriptionLabel.text = product.productDescription
            cell.stockStepper.value = Double(product.stockLevel)
            cell.stockField.text = String(product.stockLevel)
            return cell
        }
        return UITableViewCell()
    }
}

extension String {
    func toInt() -> Int? {
        return Int(self)
    }
}
