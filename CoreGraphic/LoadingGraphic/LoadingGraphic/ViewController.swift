//
//  ViewController.swift
//  LoadingGraphic
//
//  Created by Lam Le Van on 12/26/16.
//  Copyright © 2016 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var loadingView: LoadingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingView.startAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
