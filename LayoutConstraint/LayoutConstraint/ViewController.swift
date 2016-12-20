//
//  ViewController.swift
//  LayoutConstraint
//
//  Created by Lam Le Van on 12/1/16.
//  Copyright © 2016 Asian TechAsian Tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myView: UIView?
    var myView2: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        configView()
        configView2()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func configView2() {
        myView2 = UIView()
        if let myView = myView2 {
            myView.frame.origin.x = 0
            myView.frame.origin.y = 0
            myView.frame.size.height = 50
//            myView.frame.size.width = UIScreen.mainScreen().bounds.size.width
            myView.backgroundColor = UIColor.greenColor()
            view.addSubview(myView)
            myView.translatesAutoresizingMaskIntoConstraints = false
            let trailingConstraint = NSLayoutConstraint(item: view, attribute: .Trailing, relatedBy: .Equal, toItem: myView, attribute: .Trailing, multiplier: 1.0, constant: 50)
            trailingConstraint.active = true
//            let top = NSLayoutConstraint(item: view, attribute: .Top, relatedBy: .Equal, toItem: myView, attribute: .Top, multiplier: 1.0, constant: 0.0)
//            top.active = true
//            let ratioConstraint = NSLayoutConstraint(item: myView, attribute: .Width, relatedBy: .Equal, toItem: myView, attribute: .Height, multiplier: 15.0/8.0, constant: 0)
//            ratioConstraint.active = true
//            let topConstraint = NSLayoutConstraint(item: myView, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0.0)
//            topConstraint.active = true
//            let ratioConstraint = NSLayoutConstraint(item: myView, attribute: .Width, relatedBy: .Equal, toItem: myView, attribute: .Height, multiplier: 15.0/8.0, constant: 0)
//            let topConstraint = NSLayoutConstraint(item: myView, attribute: .Top, relatedBy: .Equal, toItem: topLayoutGuide, attribute: .Bottom, multiplier: 1.0, constant: 55.0)
//            let centerX = NSLayoutConstraint(item: myView, attribute: .CenterX, relatedBy: .Equal, toItem: myView.superview, attribute: .CenterX, multiplier: 1.0, constant: 0)
//            let ratioWidth = NSLayoutConstraint(item: myView, attribute: .Width, relatedBy: .Equal, toItem: myView.superview, attribute: .Width, multiplier: 240.0/375.0 , constant: 0)
//            ratioConstraint.active = true
//            topConstraint.active = true
//            centerX.active = true
//            ratioWidth.active = true
            view.layoutIfNeeded()
        }
        
    }
    
//    private func configView() {
//        myView = UIView()
//        if let myView = myView {
//            myView.backgroundColor = UIColor.greenColor()
//            view.addSubview(myView)
//            myView.translatesAutoresizingMaskIntoConstraints = false
//            
//            let ratioConstraint = NSLayoutConstraint(item: myView, attribute: .Width, relatedBy: .Equal, toItem: myView, attribute: .Height, multiplier: 15.0/8.0, constant: 0)
//            let topConstraint = NSLayoutConstraint(item: myView, attribute: .Top, relatedBy: .Equal, toItem: topLayoutGuide, attribute: .Bottom, multiplier: 1.0, constant: 55.0)
//            let centerX = NSLayoutConstraint(item: myView, attribute: .CenterX, relatedBy: .Equal, toItem: myView.superview, attribute: .CenterX, multiplier: 1.0, constant: 0)
//            let ratioWidth = NSLayoutConstraint(item: myView, attribute: .Width, relatedBy: .Equal, toItem: myView.superview, attribute: .Width, multiplier: 240.0/375.0 , constant: 0)
//            ratioConstraint.active = true
//            topConstraint.active = true
//            centerX.active = true
//            ratioWidth.active = true
//            view.layoutIfNeeded()
//        }
//    }


}

