//
//  ViewController.swift
//  CoreGraphic1
//
//  Created by Lam Le Van on 12/20/16.
//  Copyright © 2016 Asian TechAsian Tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // create a new UIView and add it to the view controller
        let myView = MyCustomView()
        myView.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        myView.backgroundColor = UIColor.yellowColor()
        view.addSubview(myView)    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
