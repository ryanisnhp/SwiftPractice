//
//  ButtonView.swift
//  CoreGraphic2
//
//  Created by Lam Le Van on 12/24/16.
//  Copyright © 2016 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

@IBDesignable
class PushButtonView: UIView {
    
    @IBInspectable var fillColor: UIColor = UIColor.green
    @IBInspectable var isAddButton: Bool = true
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        //Set plus height
        let plusHeight: CGFloat = 3.0
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
        //Create the path
        let plusPath = UIBezierPath()
        plusPath.lineWidth = plusHeight
        
        //Move to point
        plusPath.move(to: CGPoint(x: rect.width/2-plusWidth/2, y: rect.height/2))
        //Add line
        plusPath.addLine(to: CGPoint(x: bounds.width/2+plusWidth/2, y: bounds.height/2))
        
        if isAddButton {
            //Vertical line
            plusPath.move(to: CGPoint(x: rect.width/2+0.5, y: bounds.height/2-plusWidth/2+0.5))
            plusPath.addLine(to: CGPoint(x: bounds.width/2+0.5, y: bounds.height/2+plusWidth/2+0.5))
        }
        //Set the stroke color
        UIColor.white.setStroke()
        plusPath.stroke()
        
    }
}
