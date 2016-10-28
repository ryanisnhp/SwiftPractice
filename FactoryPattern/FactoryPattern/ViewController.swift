//
//  ViewController.swift
//  FactoryPattern
//
//  Created by Lam Le Van on 7/26/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let passengers = [1, 3, 5]
        for p in passengers {
            print("\(p) passengers: \(CarSelector.selectCar(p)!)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
