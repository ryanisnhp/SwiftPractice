//
//  Helpers.swift
//  CoreTextMagazine
//
//  Created by Lam Le Van on 1/5/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

// MARK: Conform CFString is hashable
extension CFString: Hashable {
    public var hashValue: Int {
        return self.hashValue
    }
}

public func ==(lhs: CFString, rhs: CFString) -> Bool { // Cast CFString to String is to prevent endless
    return (lhs as String) == (rhs as String)
}
