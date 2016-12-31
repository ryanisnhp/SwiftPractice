//
//  CounterView.swift
//  CoreGraphic2
//
//  Created by Lam Le Van on 12/25/16.
//  Copyright © 2016 dev.asiantech.lamlv. All rights reserved.
//

import UIKit


@IBDesignable class CounterView: UIView {
    
    static let NoOfGlasses = 8

    @IBInspectable var counter: Int = 5 {
        didSet {
            if counter <= CounterView.NoOfGlasses {
                setNeedsDisplay()
            }
        }
    }
    @IBInspectable var outlineColor: UIColor = UIColor.blue
    @IBInspectable var counterColor: UIColor = UIColor.orange
    
    override func draw(_ rect: CGRect) {
        //1:
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        
        //2:
        let arcWidth: CGFloat = 76

        let diameter: CGFloat = max(bounds.width, bounds.height)
        
        //4
        let startAngle: CGFloat = 3.0*CGFloat(M_PI)/4.0
        let endAngle: CGFloat = CGFloat(M_PI)/4.0
        let path = UIBezierPath(arcCenter: center, radius: diameter/2-arcWidth/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.lineWidth = arcWidth
        counterColor.setStroke()
        path.stroke()
        
        
        //Draw the outline
        let angleDifference: CGFloat = 2 * CGFloat(M_PI) - startAngle + endAngle
        let arcLengthPerGlass = angleDifference / CGFloat(CounterView.NoOfGlasses)
        let outlineEndAngle: CGFloat = arcLengthPerGlass * CGFloat(counter) + startAngle
        
        //Draw the outer arc
        let outLinePath = UIBezierPath(arcCenter: center, radius: bounds.width/2-2.5, startAngle: startAngle, endAngle: outlineEndAngle, clockwise: true)
        //Draw the inner arc
        outLinePath.addArc(withCenter: center, radius: diameter/2-arcWidth+2.5, startAngle: outlineEndAngle, endAngle: startAngle, clockwise: false)
        outLinePath.close()
        outlineColor.setStroke()
        outLinePath.lineWidth = 5.0
        outLinePath.stroke()
        
        //Counter view markers
        let context = UIGraphicsGetCurrentContext()
        //1 - Save original state
        context?.saveGState()
        outlineColor.setFill()
        
        let markerWidth: CGFloat = 5.0
        let markerSize: CGFloat = 10.0
        //2-The marker rectangle positioned at the top left
        let markerPath = UIBezierPath(rect:
            CGRect(x: -markerWidth/2,
                   y: 0,
                   width: markerWidth,
                   height: markerSize))
        //3 - Move top left of context to the previous center position
        context?.translateBy(x: rect.width/2, y: rect.height/2)
        
        for i in 1...CounterView.NoOfGlasses {
            //4 - save the centred context
            context?.saveGState()
            
            //5 - calculate the rotation angle
            let angle = arcLengthPerGlass*CGFloat(i)+startAngle-CGFloat(M_PI/2)
            //rotate and translate
            context?.rotate(by: angle)
            context?.translateBy(x: 0, y: rect.height/2-markerSize)
            //6 - fill the marker rectangle
            markerPath.fill()
            //7 - restore the centred context for the next rotate
            context?.restoreGState()
        }
        //8 - restore the original state in case of more paiting
        context?.restoreGState()
    }
    
}
