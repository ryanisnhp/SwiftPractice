//
//  StrategyPattern.swift
//  BehaviorPattern
//
//  Created by Lam Le Van on 2/5/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import Foundation

protocol MoveStrategyProtocol {
    func performMove()
}

class AbstractObjectThatMove {
    
    private var strategy: MoveStrategyProtocol
    private var whoAmI: String = "Unknown Object"
    
    required init(strategy: MoveStrategyProtocol) {
        self.strategy = strategy
    }
    
    func move() {
        strategy.performMove()
    }
    
    internal var whoAmi: String {
        get {
            return whoAmI
        }
        set {
            whoAmI = newValue
        }
    }
}


class Human: AbstractObjectThatMove {
    
    required init(strategy: MoveStrategyProtocol) {
        super.init(strategy: strategy)
        self.whoAmi = "i'm a human"
    }
}

class WalkMoveStrategy: MoveStrategyProtocol {
    func performMove() {
        print("I am walking")
    }
}
