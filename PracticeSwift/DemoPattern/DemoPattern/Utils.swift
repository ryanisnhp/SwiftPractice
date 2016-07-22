//
//  Utils.swift
//  DemoPattern
//
//  Created by Lam Le Van on 7/21/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation

class Utils {
    class func currencyStringFromNumber(number: Double) -> String {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        return formatter.stringFromNumber(number) ?? ""
    }
}