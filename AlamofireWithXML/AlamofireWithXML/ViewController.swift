//
//  ViewController.swift
//  AlamofireWithXML
//
//  Created by Le Van Lam on 2/24/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        VnexpressNetwork.sharedInstance.parseXM()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
