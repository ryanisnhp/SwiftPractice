//: Playground - noun: a place where people can play

import UIKit

struct Power {
    private var a: Int
    subscript(power: Int) -> Int {
        var s = 1
        for _ in 1...power {
            s *= self.a
        }
        return s
    }
}

class Equation {
    
    private var a: Int
    private var n: Int
    init(a: Int, n: Int) {
        self.a = a
        self.n = n
    }
    
    private func number(n: Int) -> Double {
        let power = Power(a: a)
        return Double(power[n])
    }
    
    private func result() -> Double {
        if n == 1 {
            return 1.0 / number(1)
        } else {
            return 1.0/number(n) + 1.0/number(n-1)
        }
    }
}

let equation = Equation(a: 2, n: 10)
print(equation.result())