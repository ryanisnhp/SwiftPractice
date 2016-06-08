//: Playground - noun: a place where people can play

import UIKit

//Tinh cos(x^2)

class Equation {
    
    private var x: Double
    init(x: Double) {
        self.x = x
    }
    
    private var xPower: Double {
        return pow(x, 2)
    }
    
    private func calculate() -> Double {
        return cos(xPower)
    }
}

let equation = Equation(x: 10)
print(equation.calculate())