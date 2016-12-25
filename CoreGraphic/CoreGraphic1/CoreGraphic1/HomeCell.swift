//
//  HomeCell.swift
//  CoreGraphic1
//
//  Created by Lam Le Van on 12/23/16.
//  Copyright © 2016 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

protocol Identifiler {
    
    static var height: CGFloat {get}
    static var identifier: String {get}
}

class HomeCell: UITableViewCell, Identifiler {
    
    static var height: CGFloat = 189.0
    static var identifier = "HomeCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

class BackgroundView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func draw(_ rect: CGRect) {
        let path = createBezierPath()
        let fillColor = UIColor.white
        fillColor.setFill()
        
        let strokeColor = UIColor.red
        strokeColor.setStroke()
        
        path.fill()
        path.stroke()
        setNeedsDisplay()
        
    }
    
    private func createBezierPath() -> UIBezierPath {
        let path = UIBezierPath()
        
        // Begin
        path.move(to: CGPoint(x: 0, y: 153))
        
        // Seg1: Line
        path.addLine(to: CGPoint(x: 0, y: 30))
        
        // Seg2: Add curve
        path.addArc(withCenter: CGPoint(x: 15, y: 15), radius: 15, startAngle: CGFloat(M_PI), endAngle: CGFloat(3*M_PI/2), clockwise: true)
        
        // Seg3: Add line
        path.addLine(to: CGPoint(x: 339, y: 0))
        
        // Seg4: Add line
        path.addLine(to: CGPoint(x: 339, y: 123))
        
        // Seg5: Add curve
        path.addArc(withCenter: CGPoint(x: 324, y: 138), radius: 15, startAngle: 0, endAngle: CGFloat(M_PI/2), clockwise: true)
        path.close()
        
        return path
    }
}
