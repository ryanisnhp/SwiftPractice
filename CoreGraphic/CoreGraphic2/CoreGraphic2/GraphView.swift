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
    let graphPoints: [Int] = [4, 2, 6, 4, 5, 8, 3]

    override func draw(_ rect: CGRect) {
        
        /// Clipping areas
        let width = rect.width
        let height = rect.height
        
        //set up background clipping area
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.allCorners, cornerRadii: CGSize(width: 8.0, height: 8.0))
        path.addClip()
        
        /// trickly calculations for graph points
        //Weekly sample data
        //Calculate the x point
        let margin: CGFloat = 20.0
        let columnXPoint = { (column: Int) -> CGFloat in
            //Calculate gap between points
            let spacer = (width - margin*2-4)/CGFloat(self.graphPoints.count-1)
            var x: CGFloat = CGFloat(column)*spacer
            x = x + margin+2
            return x
        }
        //Calculate the y point
        let topBorder: CGFloat = 60
        let bottomBorder: CGFloat = 50
        let graphHeight = height - topBorder - bottomBorder
        let maxValue = graphPoints.max()
        let columnYPoint = { (graphPoint: Int) -> CGFloat in
            var y: CGFloat = CGFloat(graphPoint)/CGFloat(maxValue!)*graphHeight
            y = graphHeight + topBorder - y // Flip the grap
            return y
        }
        
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
        //Draw the line graph
        UIColor.white.setFill()
        UIColor.white.setStroke()
        
        //Set up the points line
        let graphPath = UIBezierPath()
        //Go to the start of line
        graphPath.move(to: CGPoint(x: columnXPoint(0), y: columnYPoint(graphPoints[0])))
        //add points for each item in the graphPoints array at the correct (x,y) for the point
        for i in 1..<graphPoints.count {
            let nextPoint = CGPoint(x: columnXPoint(i), y: columnYPoint(graphPoints[i]))
            graphPath.addLine(to: nextPoint)
        }
        graphPath.stroke()
        
        /// A Gradient graph
        //Create the clipping path for the graph gradient
        //1 - Save the state of the context (commented out for now)
        //CGContextSaveGState(context)
        
        //2, 3 - make a copy of the path and addline to the copied path to complete the clip area
        if let clippingPath = graphPath.copy() as? UIBezierPath {
            clippingPath.addLine(to: CGPoint(x: columnXPoint(graphPoints.count-1), y: height))
            clippingPath.addLine(to: CGPoint(x: columnXPoint(0), y: height))
            clippingPath.close()
            
            //4 - add the clipping path to the context
            clippingPath.addClip()
            
//            //5 - check clipping path - temporary code
//            UIColor.green.setFill()
//            let rectPath = UIBezierPath(rect: bounds)
//            rectPath.fill()

        }
        if let context = context, let gradient = gradient {
            let highestYPoint = columnYPoint(maxValue!)
            startPoint = CGPoint(x: margin, y: highestYPoint)
            endPoint = CGPoint(x: margin, y: bounds.height)
            context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: [])
        }
        //Draw the line on top of the clipped gradient
        graphPath.lineWidth = 2.0
        graphPath.stroke()
        
        //Draw the circles on top of graph stroke
        for i in 0..<graphPoints.count {
            var point = CGPoint(x: columnXPoint(i), y: columnYPoint(graphPoints[i]))
            point.x = point.x - 5.0/2
            point.y = point.y - 5.0/2
            let circle = UIBezierPath(ovalIn: CGRect(origin: point, size: CGSize(width: 5.0, height: 5.0)))
            circle.fill()
        }
    }
}
