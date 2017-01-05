//
//  MedalView.swift
//  CoreGraphic2
//
//  Created by Lam Le Van on 12/31/16.
//  Copyright © 2016 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

@IBDesignable class MedalView: UIView {
    
    override func draw(_ rect: CGRect) {
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        //Gold color
        let darkGoldColor = UIColor(red: 0.6, green: 0.5, blue: 0.15, alpha: 1.0)
        let midGoldColor = UIColor(red: 0.86, green: 0.73, blue: 0.3, alpha: 1.0)
        let lightColor = UIColor(red: 1.0, green: 0.98, blue: 0.9, alpha: 1.0)
        
        //Lower Ribbon
        let lowerRibbonPath = UIBezierPath()
        lowerRibbonPath.move(to: CGPoint(x: 0, y: 0 ))
        lowerRibbonPath.addLine(to: CGPoint(x: 40, y: 0))
        lowerRibbonPath.addLine(to: CGPoint(x: 78, y: 70))
        lowerRibbonPath.addLine(to: CGPoint(x: 38, y: 70))
        lowerRibbonPath.close()
        UIColor.red.setFill()
        lowerRibbonPath.fill()
        //Clasp
        let claspPath = UIBezierPath(roundedRect: CGRect(x: 36, y: 62, width: 43, height: 20), cornerRadius: 5.0)
        claspPath.lineWidth = 5
        darkGoldColor.setStroke()
        claspPath.stroke()
        //Medallion
        let medallionPath = UIBezierPath(ovalIn: CGRect(origin: CGPoint(x: 8, y: 72), size: CGSize(width: 100, height: 100)))
        context?.saveGState()
        
        medallionPath.addClip()
        
        let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: [darkGoldColor.cgColor, midGoldColor.cgColor, lightColor.cgColor] as CFArray, locations: [0, 0.51, 1])
        context?.drawLinearGradient(gradient!, start: CGPoint(x: 40, y: 40), end: CGPoint(x: 40, y: 162), options: [])
        
        context?.restoreGState()
        
        //Upper ribbon
        let upperRibbonPath = UIBezierPath()
        upperRibbonPath.move(to: CGPoint(x: 68, y: 0))
        upperRibbonPath.addLine(to: CGPoint(x: 108, y: 0))
        upperRibbonPath.addLine(to: CGPoint(x: 78, y: 70))
        upperRibbonPath.addLine(to: CGPoint(x: 38, y: 70))
        upperRibbonPath.close()
        UIColor.blue.setFill()
        upperRibbonPath.fill()
        
        //Number one
        let numberOne: NSString = "1"
        let numberOneRect = CGRect(x: 47, y: 100, width: 50, height: 50)
        let font = UIFont(name: "Academy Engraved LET", size: 60)
        let numberOneAttributes = [
            NSFontAttributeName: font!,
            NSForegroundColorAttributeName: darkGoldColor
        ]
        numberOne.draw(in: numberOneRect, withAttributes: numberOneAttributes)
        
        //This code must always be at the end of the playground
        UIGraphicsEndImageContext()
        //Add Shadow
        let shadow: UIColor = UIColor.black.withAlphaComponent(0.8)
        let shadowOffset = CGSize(width: 2.0, height: 2.0)
        let shadowBlurRadius: CGFloat = 5
        
        context?.setShadow(offset: shadowOffset, blur: shadowBlurRadius, color: shadow.cgColor)
        context?.beginTransparencyLayer(auxiliaryInfo: nil)
        context?.endTransparencyLayer()
    }
}
