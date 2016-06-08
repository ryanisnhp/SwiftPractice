//: Playground - noun: a place where people can play

import UIKit

//Tinh x^2 - sin(x)

class Equation {
    
    private var x: Double
    
    init(x: Double) {
        self.x = x
    }
    
    private func calculation() -> Double {
        return pow(x, 2) - sin(x)
    }
}

let equa = Equation(x: 10)
print(equa.calculation())
