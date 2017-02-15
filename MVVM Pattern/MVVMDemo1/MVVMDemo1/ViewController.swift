//
//  ViewController.swift
//  MVVMDemo1
//
//  Created by LeVanLam on 2/15/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ferrariF12 = Car(model: "F12", make: "Ferrari", horsepower: 730, photoURL: "http://auto.ferrari.com/en_EN/wp-content/uploads/sites/5/2013/07/Ferrari-F12berlinetta.jpg")
        let ferrariViewModel = CarViewModel(car: ferrariF12)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
