//
//  AbstractCard.swift
//  CreationPattern
//
//  Created by Lam Le Van on 1/27/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

class AbstractCard: Card {
    
    var _name: String?
    var _mana: Int?
    var _attack: Int?
    var _defense: Int?
    
    init(name: String?, mana: Int?, attack: Int?, defense: Int?) {
        _name = name
        _mana = mana
        _attack = attack
        _defense = defense
    }
    
    init() {
    }
    
    var name: String? {
        get {
            return _name
        }
        set {
            _name = newValue
        }
    }
    var attack: Int? {
        get {
            return _attack
        }
        set {
            _attack = newValue
        }
    
    }
    var defense: Int? {
        get {
            return _defense
        }
        set {
            _defense = newValue
        }
    
    }
    var mana: Int? {
        get {
            return _mana
        }
        set {
            _mana = newValue
        }
    }
    
    func clone() -> Card {
        return AbstractCard(name: name, mana: mana, attack: attack, defense: defense)
    }
    
    var debugDescription: String {
        return "\(name)-\(mana)-\(attack)-\(defense)"
    }

}
