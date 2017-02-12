//
//  ViewController.swift
//  SwiftMergeSort
//
//  Created by Lam Le Van on 2/12/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let array = [7, 2, 6, 3, 9]
        print(mergeSort(array))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
