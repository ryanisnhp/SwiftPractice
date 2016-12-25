//
//  ViewController.swift
//  CoreGraphic2
//
//  Created by Lam Le Van on 12/24/16.
//  Copyright © 2016 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var label: UILabel! {
        didSet {
            label.text = "\(counterView.counter)"
        }
    }
    @IBOutlet private weak var counterView: CounterView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnPushButton(button: PushButtonView) {
        if button.isAddButton {
            if counterView.counter < CounterView.NoOfGlasses {
                counterView.counter = counterView.counter + 1
            }
        } else {
            if counterView.counter > 0 {
                counterView.counter = counterView.counter - 1
            }
        }
    }
}
