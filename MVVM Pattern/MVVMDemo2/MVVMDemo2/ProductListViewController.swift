//
//  ProductListViewController.swift
//  MVVMDemo2
//
//  Created by LeVanLam on 2/17/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: ProductListViewModelProtocol! {
        didSet {
            self.viewModel.productDidChange = { [weak self] viewModel in
                guard let this = self else {
                    return
                }
                this.tableView.dataSource = viewModel.productListDataSource
                this.tableView.delegate = viewModel.productListDelegate
                this.tableView.reloadData()
            }
        }
    }
    
    let products = [
        Product(name: "Keyboard", price: 6),
        Product(name: "Mouse", price: 5)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let viewModel = ProductListViewModel(products: products)
        self.viewModel = viewModel
        self.viewModel.showProductList()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
