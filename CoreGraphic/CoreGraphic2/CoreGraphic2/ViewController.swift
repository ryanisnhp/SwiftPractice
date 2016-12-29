//
//  ViewController.swift
//  CoreGraphic2
//
//  Created by Lam Le Van on 12/24/16.
//  Copyright © 2016 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var graphView: UIView!
    var isGraphViewShowing = false

    
    @IBOutlet private weak var label: UILabel! {
        didSet {
            label.text = "\(counterView.counter)"
        }
    }
    @IBOutlet private weak var counterView: CounterView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupUI() {
        addContainerViewGesture()
    }
    
    private func addContainerViewGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(counterViewTap))
        containerView.addGestureRecognizer(gesture)
    }
    
    @objc private func counterViewTap(gesture: UITapGestureRecognizer?) {
        
        //showHideTransitionViews prevent toView removed on superview
        if isGraphViewShowing {
            UIView.transition(from: graphView, to: counterView, duration: 1.0, options: [UIViewAnimationOptions.transitionFlipFromLeft, UIViewAnimationOptions.showHideTransitionViews], completion: nil)
        } else {
            UIView.transition(from: counterView, to: graphView, duration: 1.0, options: [UIViewAnimationOptions.transitionFlipFromRight, UIViewAnimationOptions.showHideTransitionViews], completion: nil)
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
