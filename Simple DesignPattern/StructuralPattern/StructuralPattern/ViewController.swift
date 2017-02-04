//
//  ViewController.swift
//  StructuralPattern
//
//  Created by Lam Le Van on 1/31/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        useDecoratorPattern()
        useProxyPattern()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private func useDecoratorPattern() {
        let rectangle = Rectangle()
        let square = Square()
        let roundedRectangle = RoundedCornerShapeDecorator(decoratedShape: rectangle)
        let roundedSquare = RoundedCornerShapeDecorator(decoratedShape: square)
        print(rectangle.draw())
        print(square.draw())
        print(roundedRectangle.draw())
        print(roundedSquare.draw())
    }
    
    private func useProxyPattern() {
        let animation = ScreenShot()
        print(animation.display())
        print(animation.click())
        print( animation.display())
    }
}

