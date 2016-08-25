//
//  Prototype.swift
//  CreationalPattern
//
//  Created by Lam Le Van on 8/13/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation

class AbstractCard: NSObject, NSCopying {
    var name: String
    var mana: Int
    var attack: Int
    var defense: Int
    
    init(name: String, mana: Int, attack: Int, defense: Int) {
        self.name = name
        self.mana = mana
        self.attack = attack
        self.defense = defense
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        return AbstractCard(name: self.name, mana: self.mana, attack: self.attack, defense: self.defense)
    }
    
    //
    //    func clone() -> AbstractCard {
    //        return AbstractCard(name: self.name, mana: self.mana, attack: self.attack, defense: self.defense)
    //    }
}

class Card: AbstractCard {
    
    override init(name: String, mana: Int, attack: Int, defense: Int) {
        super.init(name: name, mana: mana, attack: attack, defense: defense)
    }
}