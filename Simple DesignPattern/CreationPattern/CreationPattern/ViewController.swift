//
//  ViewController.swift
//  CreationPattern
//
//  Created by Lam Le Van on 1/27/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        abstractCardObject()
        factoryPatterhObject()
    }
    
    private func abstractCardObject() {
        //This is the card that we will copy
        let card = CardFactory.createCard(cardType: CardType.facelessManipulator)
        if let card = card {
            print(card)
        }
    }
    
    private func factoryPatterhObject() {
        let manufacture1 = WatchFactory.getFactory(size: WatchSize._38mm)
        let productA = manufacture1.createBand(bandType: BandType.milanese)
        print(productA.color)
        print(productA.size)
        print(productA.type)
        
        let productB = manufacture1.createDial(materialType: MaterialType.gold)
        print(productB.material)
        print(productB.size)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
