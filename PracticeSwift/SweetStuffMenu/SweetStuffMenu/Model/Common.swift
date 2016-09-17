//
//  Common.swift
//  SweetStuffMenu
//
//  Created by Lam Le Van on 9/17/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit

struct Colors {
    static let blueColor = UIColor(red: 97, green: 213, blue: 242)
    static let greenColor = UIColor(red: 150, green: 229, blue: 144)
    static let yellowColor = UIColor(red: 226, green: 203, blue: 98)
    static let redColor = UIColor(red: 231, green: 138, blue: 138)
}

struct ScreenSize {
    static let width = UIScreen.mainScreen().bounds.size.width
    static let height = UIScreen.mainScreen().bounds.size.height
    static let iP6Width = 375
    static let iP6Height = 667
}

struct Ratio {
    static let horizontal = ScreenSize.width * ScreenSize.iP6Height.cgFloat() / ScreenSize.iP6Width.cgFloat()
    static let vertical = ScreenSize.height * ScreenSize.iP6Width.cgFloat() / ScreenSize.iP6Height.cgFloat()
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: red.cgFloat(), green: green.cgFloat(), blue: blue.cgFloat(), alpha: 1.0)
    }
}

extension Int {
    func cgFloat() -> CGFloat {
        return CGFloat(self)
    }
}