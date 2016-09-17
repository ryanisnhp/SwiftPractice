//
//  ViewController.swift
//  SweetStuffMenu
//
//  Created by Lam Le Van on 9/17/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var containerLayer: CALayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeContainerLayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Private method
    
    private func initializeContainerLayer() {
        containerLayer = CALayer()
        if let containerLayer = containerLayer {
            containerLayer.frame = CGRect(x: 0, y: 0, width: ScreenSize.width, height: ScreenSize.height)
            containerLayer.backgroundColor = UIColor.blueColor().CGColor
            self.view.layer.addSublayer(containerLayer)
        }
    }
}
