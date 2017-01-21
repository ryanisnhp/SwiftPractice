//
//  Edge.swift
//  GraphWithAdjacencyList
//
//  Created by Lam Le Van on 1/21/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

public enum EdgeType {
    case directed, undirected
}

public struct Edge<T: Hashable> {
    public var source: Vertex<T>
    public var destination: Vertex<T>
    public var weight: Double?
}
