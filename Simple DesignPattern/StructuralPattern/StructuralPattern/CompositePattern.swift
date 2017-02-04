//
//  CompositePattern.swift
//  StructuralPattern
//
//  Created by Lam Le Van on 2/4/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

class VODComponent {
    func add(vodComponent: VODComponent) {
        assert(false, "This method is not supported")
    }
    
    func remove(vodComponent: VODComponent) {
        assert(false, "This method is not supported")
    }
    
    func getName() -> String {
        assert(false, "This method is not supported")
    }
    
    func getDescription() -> String {
        assert(false, "This method is not supported")
    }
    
    func getPrice() -> Double {
        assert(false, "This method is not supported")
    }
    
    func getChild(i: Int) -> VODComponent {
        assert(false, "This method is not supported")
    }
    
    func display() {
        assert(false, "This method is not supported")
    }
}

class VODItem: VODComponent {
    
    private var name: String
    private var description: String
    private var price: Double
    
    init(name: String, description: String, price: Double) {
        self.description = description
        self.name = name
        self.price = price
    }
    
    override func getName() -> String {
        return name
    }
    
    override func getPrice() -> Double {
        return price
    }
    
    override func getDescription() -> String {
        return description
    }
    
    override func display() {
        print(" \(name), \(price), ---- \(description)")
    }
}

class VODCategory: VODComponent {
    
    var vodComponents: [VODComponent] = []
    private var name: String
    private var description: String
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
    
    override func add(vodComponent: VODComponent) {
        vodComponents.append(vodComponent)
    }
    
    override func remove(vodComponent: VODComponent) {
        vodComponents.removeObject(vodComponent)
    }
    
    override func getChild(i: Int) -> VODComponent {
        return vodComponents[i]
    }
    
    override func getName() -> String {
        return name
    }
    
    override func getDescription() -> String {
        return description
    }
    
    override func display() {
        print((" \(name), ---- \(description)"))
    }
}

class VODManager {
    var catalog: VODComponent
    
    init(vod: VODComponent) {
        catalog = vod
    }
    
    func displayCatalog() {
        catalog.display()
    }
}

extension VODComponent: Equatable {
    static func ==(lhs: VODComponent, rhs: VODComponent) -> Bool {
        return lhs.getName() == rhs.getName() && lhs.getDescription() == rhs.getDescription()
    }
}

extension Array where Element: Equatable {
    
    mutating func removeObject(_ object: Element) {
        if let index = index(of: object) {
            self.remove(at: index)
        }
    }
}
