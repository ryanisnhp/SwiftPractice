//
//  ViewController.swift
//  CoreGraphic1
//
//  Created by Lam Le Van on 12/21/16.
//  Copyright © 2016 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customView = CustomView2(frame: CGRect(x: 40, y: 40, width: 40, height: 40))
        customView.backgroundColor = UIColor.yellow
        view.addSubview(customView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
