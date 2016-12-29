//
//  GraphView.swift
//  CoreGraphic2
//
//  Created by Lam Le Van on 12/29/16.
//  Copyright © 2016 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

@IBDesignable class GraphView: UIView {
    
    //1 - the properties for the gradient
    @IBInspectable var startColor: UIColor = UIColor.red
    @IBInspectable var endColor: UIColor = UIColor.green
    
    override func draw(_ rect: CGRect) {
        
        //2 - Get the current context
        let context = UIGraphicsGetCurrentContext()
        let colors: [CGColor] = [startColor.cgColor, endColor.cgColor]
        
        //3 - set up the color space
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        //4 - set up the color stops
        let colorLocations: [CGFloat] = [0.0, 1.0]
        
        //5- create the gradient
        let gradient = CGGradient(colorsSpace: colorSpace,
                                  colors: colors as CFArray,
                                  locations: colorLocations)
        //6 - draw the gradient
        var startPoint = CGPoint.zero
        var endPoint = CGPoint(x: 0, y: bounds.height)
        if let context = context, let gradient = gradient {
            context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: [])
        }
    }
    
}
