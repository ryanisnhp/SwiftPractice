//
//  CustomView.swift
//  CoreGraphic1
//
//  Created by Lam Le Van on 12/21/16.
//  Copyright © 2016 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

// Link Reference: http://stackoverflow.com/questions/21311880/drawing-uibezierpath-on-code-generated-uiview

class CustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
    }
    
    private func createBezierPath() -> UIBezierPath {
        let path = UIBezierPath()
        
    }
}
