//
//  Milkshake.swift
//  BuilderPattern
//
//  Created by Le Van Lam on 7/27/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation

class Milkshake {
    
    enum Size {
        case SMALL
        case MEDIUM
        case LARGE
    }
    
    enum Flavor {
        case CHOCOLATE
        case STRAWBERRY
        case VANILLA
    }
    
    let count: Int
    let size: Size
    let flavor: Flavor
    
    init(flavor:Flavor, size:Size = Size.MEDIUM, count:Int = 1) {
        self.count = count;
        self.size = size;
        self.flavor = flavor;
    }
    
    convenience init(flavor: Flavor, size: Size) {
        self.init(flavor: flavor, size: size, count: 1)
    }
    
    convenience init(flavor: Flavor) {
        self.init(flavor: flavor, size: Milkshake.Size.MEDIUM, count: 1)
    }
}