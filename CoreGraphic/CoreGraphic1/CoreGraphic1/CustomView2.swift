//
//  CustomView2.swift
//  CoreGraphic1
//
//  Created by Lam Le Van on 12/22/16.
//  Copyright © 2016 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

class CustomView2: UIView {
    
    override func draw(_ rect: CGRect) {
        let path = createBezierPath()
        
        let fillColor = UIColor.white
        fillColor.setFill()
        
        path.lineWidth = 1.0
        let strokeColor = UIColor.blue
        strokeColor.setStroke()
        
        path.apply(CGAffineTransform(translationX: 10, y: 10))
        
        path.fill()
        path.stroke()
    }
    
    func createBezierPath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 3, y: 26))
        //Seg 0: Arc
        path.addArc(withCenter: CGPoint(x: 3, y: 25), radius: 1, startAngle: CGFloat(M_PI/2), endAngle: CGFloat(M_PI), clockwise: true)
        
        //Seg 1: Line
        path.addLine(to: CGPoint(x: 2, y: 15))
        
        //Seg 2: Curve
        path.addCurve(to: CGPoint(x: 0, y: 12), controlPoint1: CGPoint(x: 2, y: 14), controlPoint2: CGPoint(x: 0, y: 14))
        
        //Seg3: Line
        path.addLine(to: CGPoint(x: 0, y: 2))
        
        //Seg4: Arch
        path.addArc(withCenter: CGPoint(x: 2, y: 2), radius: 2, startAngle: CGFloat(M_PI), endAngle: CGFloat(M_PI*3/2), clockwise: true)
        
        //Seg5: Line
        path.addLine(to: CGPoint(x: 8, y: 0))
        
        //Seg6: Arch
        path.addArc(withCenter: CGPoint(x: 8, y: 2), radius: 2, startAngle: CGFloat(3*M_PI/2), endAngle: 0, clockwise: true)
        
        //Seg7: Add line
        path.addLine(to: CGPoint(x: 10, y: 12))
        
        //Curce
        path.addCurve(to: CGPoint(x: 8, y: 15), controlPoint1: CGPoint(x: 10, y: 14), controlPoint2: CGPoint(x: 8, y: 14))
        
        //Seg9: line
        path.addLine(to: CGPoint(x: 8, y: 25))
        
        //Seg 9: Add curve
        path.addArc(withCenter: CGPoint(x: 7, y: 25), radius: 1, startAngle: 0, endAngle: CGFloat(M_PI/2), clockwise: true)
        
        //Seg10: line
        path.close()
        
        return path
    }

}
