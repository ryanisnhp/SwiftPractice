//: Playground - noun: a place where people can play

import UIKit

class Equation {
    
    private var x: Double
    init(x: Double) {
        self.x = x
    }
    
    private var identifying: Bool {
        return x != 0
    }
    
    private func calculate() -> String {
        if identifying {
            return "Result: \((9 * pow(x, 2) + 15)/(7 * sqrt(pow(x, 1))))"
        } else {
            return "Invalid"
        }
    }
}

let equa = Equation(x: 10)
equa.calculate()