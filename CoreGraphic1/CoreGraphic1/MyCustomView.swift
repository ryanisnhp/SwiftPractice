//
//  MyCustomView.swift
//  CoreGraphic1
//
//  Created by Lam Le Van on 12/20/16.
//  Copyright © 2016 Asian TechAsian Tech. All rights reserved.
//

import UIKit

class MyCustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        let shapeLayer = CAShapeLayer()
        
        // a CGPath before it can be used on a layer
        shapeLayer.path = createBezierPah().CGPath
        shapeLayer.strokeColor = UIColor.blueColor().CGColor
        shapeLayer.fillColor = UIColor.whiteColor().CGColor
        shapeLayer.lineWidth = 1.0
        shapeLayer.position = CGPoint(x: 10, y: 10)
        layer.addSublayer(shapeLayer)
    }
    
    private func createBezierPah() -> UIBezierPath {
        
        // create a new path
        let path = UIBezierPath()
        
        // starting point for the path (bottom left)
        path.moveToPoint(CGPoint(x: 2, y: 26))
        
        // left side
        path.addLineToPoint(CGPoint(x: 2, y: 15))
        
        // add curve
        path.addCurveToPoint(CGPoint(x: 0, y: 12), controlPoint1: CGPoint(x: 2, y: 14), controlPoint2: CGPoint(x: 0, y: 14))
        
        // line
        path.addLineToPoint(CGPoint(x: 0, y: 2))
        
        // seg 4: arc
        path.addArcWithCenter(CGPoint(x: 2, y: 2), // center point of circle
                              radius: 2, // this will make it meet our path line
                              startAngle: CGFloat(M_PI),
                              endAngle: CGFloat(M_PI * 3 / 2),
                              clockwise: true) // startAngle to endAngle goes in a clockwise direction
        
        // seg 5: add line
        path.addLineToPoint(CGPoint(x: 10, y: 0))
        
        // seg6: arch
        path.addArcWithCenter(CGPoint(x: 8, y: 12),
                              radius: 2,
                              startAngle: CGFloat(M_PI * 3 / 2),
                              endAngle: 0, clockwise: true)
//        // seg7: add line
//        path.addLineToPoint(CGPoint(x: 10, y: 12))
//        
//        // seg8 : add arch
//        path.addCurveToPoint(CGPoint(x: 8, y: 15), // ending point
//                             controlPoint1: CGPoint(x: 10, y: 14),
//                             controlPoint2: CGPoint(x: 8, y: 14))
//        // seg9: line
//        path.addLineToPoint(CGPoint(x: 8, y: 26))
        
        // seg10: line
        path.closePath() // Draw
        
        return path
    }
}
