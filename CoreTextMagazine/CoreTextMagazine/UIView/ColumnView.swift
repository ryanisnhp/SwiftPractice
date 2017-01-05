//
//  ColumnView.swift
//  CoreTextMagazine
//
//  Created by Lam Le Van on 1/2/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import UIKit
import SwiftUtils

class ColumnView: UIView {
    
    private var images: [[String]] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(images: [[String]], frame: CGRect) {
        self.init(frame: frame)
        self.images = images
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        //Flip the coordinate system
        if let context = context {
            context.textMatrix = .identity
            context.translateBy(x: 0, y: kScreenSize.height)
            CTFrameDraw(frame as! CTFrame, context)
            for imageData in images {
                let img: UIImage = UIImage(named: imageData[0])!
                let imgBounds = CGRectFromString(imageData[1])
                context.draw(img.cgImage!, in: imgBounds)
            }
        }
    }
    
}
