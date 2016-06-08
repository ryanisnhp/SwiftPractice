//: Playground - noun: a place where people can play

import UIKit

//Tinh 1 + ln(x^2)

class Equation {
    
    private var x: Double
    
    init(x: Double) {
        self.x = x
    }
    
    private var test: Double {
        return log10(10)
    }
    private var isIdentifying: Bool {
        return x != 0
    }
    
    private func calculate() -> String {
        if isIdentifying {
            return "Result: \(1 + log(pow(x, 2)))"
        } else {
            return "Invalid"
        }
    }
}

let equation = Equation(x: 10)
equation.calculate()
