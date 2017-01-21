//
//  Graphable.swift
//  GraphWithAdjacencyList
//
//  Created by Lam Le Van on 1/21/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

protocol Graphable {
    associatedtype Element: Hashable
    var description: CustomStringConvertible { get }
    func createVertex(data: Element) -> Vertex<Element>
    func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func edges(from source: Vertex<Element>) -> [Edge<Element>]?
}
