//
//  ProductListViewModelProtocol.swift
//  MVVMDemo2
//
//  Created by LeVanLam on 2/18/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import Foundation

protocol ProductListViewModelProtocol: class {
    var products: [Product] {get set}
    init(products: [Product])
    var productListDataSource: ProductListDataSource! {get set}
    var productListDelegate: ProductListDelegate! {get set}
    var productDidChange: ((ProductListViewModelProtocol) -> ())? {get set}
    func showProductList()
}
