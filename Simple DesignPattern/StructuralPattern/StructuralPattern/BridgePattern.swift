//
//  BridgePattern.swift
//  StructuralPattern
//
//  Created by Lam Le Van on 2/4/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

protocol IAbstractBridge {
    var concreteImpl: ImplementationBase {get set}
    func turnOn()
}

protocol ImplementationBase {
    func run()
}

//Concrete Abstraction
class RemoteControl: IAbstractBridge {
    
    internal var concreteImpl: ImplementationBase

        init(concreteImpl: ImplementationBase) {
        self.concreteImpl = concreteImpl
    }
    func turnOn() {
        self.concreteImpl.run()
    }
}

//Implementation Classes 1

class TV: ImplementationBase {
    func run() {
        print("tv turned on")
    }
}

class Light: ImplementationBase {
    func run() {
        print("light turned on")
    }
}
