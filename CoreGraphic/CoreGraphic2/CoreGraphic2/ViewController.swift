//
//  ViewController.swift
//  CoreGraphic2
//
//  Created by Lam Le Van on 12/24/16.
//  Copyright © 2016 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var counterView: CounterView!
    @IBOutlet private weak var graphView: GraphView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var label: UILabel! {
        didSet {
            label.text = "\(counterView.counter)"
        }
    }
    
    var isGraphViewShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Mark: - Private method
    private func addGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(changeView))
        containerView.addGestureRecognizer(gesture)
    }
    
    @objc private func changeView(gesture: UITapGestureRecognizer?) {
        if isGraphViewShowing {
            UIView.transition(from: counterView, to: graphView, duration: 1.0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        } else {
            UIView.transition(from: graphView, to: counterView, duration: 1.0, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        }
        isGraphViewShowing = !isGraphViewShowing
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
