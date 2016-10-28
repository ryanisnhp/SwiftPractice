//
//  ViewController.swift
//  BuilderPattern
//
//  Created by Le Van Lam on 7/27/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let builder = BurgerBuilder.getBuilder(Burgers.BIGBURGER)
        let name = "Joe"
        
        builder.setVeggie(false)
        builder.setMayo(false)
        builder.setCooked(Burger.Cooked.WELLDONE)
        builder.addPatty(false)
        let order = builder.buildObject(name)
        order.printDescription()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

