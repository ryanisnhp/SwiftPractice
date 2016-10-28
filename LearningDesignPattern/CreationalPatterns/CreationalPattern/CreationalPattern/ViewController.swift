//
//  ViewController.swift
//  CreationalPattern
//
//  Created by Lam Le Van on 8/13/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manufacture1 = WatchFactory.getFactory(WatchSize._38mm)
        let productA = manufacture1?.createBand(BandType.Milanese)
        print(productA?.color)
        print(productA?.size.rawValue)
        print(productA?.type.rawValue)
        
        let productB = manufacture1?.createDial(MaterialType.Gold)
        print(productB?.material.rawValue)
        print(productB?.size.rawValue)
        
        let manufacture2 = WatchFactory.getFactory(WatchSize._42mm)
        let productC = manufacture2?.createBand(BandType.LinkBracelet)
        print(productC?.color)
        print(productC?.size.rawValue)
        print(productC?.type.rawValue)
        
        let productD = manufacture2?.createDial(MaterialType.Gold)
        print(productD?.material.rawValue)
        print(productD?.size.rawValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

