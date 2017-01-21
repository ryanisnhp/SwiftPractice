//
//  Vertex.swift
//  GraphWithAdjacencyList
//
//  Created by Lam Le Van on 1/21/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

public struct Vertex<T: Hashable> {
    var data: T
}

extension Vertex: Hashable {
    public var hashValue: Int {
        return "\(data)".hashValue
    }
    
    static public func ==(lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.data == rhs.data
    }
}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(data)"
    }
}
