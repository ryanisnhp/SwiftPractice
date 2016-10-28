//
//  ViewController.swift
//  AdapterPattern
//
//  Created by Le Van Lam on 7/27/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let search = SearchTool(dataSources: SalesDataSource(), DevelopmentDataSource())
        print("--List--")
        for e in search.employees {
            print("Name: \(e.name)")
        }
        
        print("--Search--")
        for e in search.search("VP", type: SearchTool.SearchType.TITLE) {
            print("Name: \(e.name), Title: \(e.title)")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

