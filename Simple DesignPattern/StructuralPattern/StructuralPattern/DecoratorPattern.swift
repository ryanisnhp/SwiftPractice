//
//  DecoratorPattern.swift
//  StructuralPattern
//
//  Created by Lam Le Van on 2/4/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

protocol IShape {
    func draw() -> String
}

class Square: IShape {
    func draw() -> String {
        return "drawing Shape: Square"
    }
}

class Rectangle: IShape {
    func draw() -> String {
        return "drawing Shape: Rectangle"
    }
}

class ShapeDecorator: IShape {
    
    fileprivate let decoratedShape: IShape
    
    required init(decoratedShape: IShape) {
        self.decoratedShape = decoratedShape
    }
    
    func draw() -> String {
        fatalError("Not implemented")
    }
}

class RoundedCornerShapeDecorator: ShapeDecorator {
    
    required init(decoratedShape: IShape) {
        super.init(decoratedShape: decoratedShape)
    }
    
    override func draw() -> String {
        return decoratedShape.draw() + ", " + setRoundedCornerShape(decoratedShape: decoratedShape)
    }
    
    func setRoundedCornerShape(decoratedShape: IShape) -> String {
        return "Corners are rounded"
    }
}
