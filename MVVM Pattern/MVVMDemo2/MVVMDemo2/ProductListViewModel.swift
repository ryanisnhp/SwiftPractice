//
//  ProductListViewModel.swift
//  MVVMDemo2
//
//  Created by LeVanLam on 2/18/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit

class ProductListViewModel: ProductListViewModelProtocol {
    
    var products: [Product]
    var productListDataSource: ProductListDataSource! {
        didSet {
            self.productDidChange?(self)
        }
    }
    var productListDelegate: ProductListDelegate! {
        didSet {
            self.productDidChange?(self)
        }
    }
    
    required init(products: [Product]) {
        self.products = products
    }
    
    var productDidChange: ((ProductListViewModelProtocol) -> ())?
    
    func showProductList() {
        productListDataSource = ProductListDataSource(products: products)
        productListDelegate = ProductListDelegate(products: products)
        
    }
}

class ProductListDataSource: NSObject {
    
    var products: [Product]
    required init(products: [Product]) {
        self.products = products
    }
    
}

extension ProductListDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let product = products[indexPath.row]
        cell.textLabel?.text = product.name
        return cell
    }
}

class ProductListDelegate: NSObject {
    
    var products: [Product]
    required init(products: [Product]) {
        self.products = products
    }
}

extension ProductListDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ProductListDelegate: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scroll")
    }
}
