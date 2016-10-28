//: Playground - noun: a place where people can play

import UIKit

extension Int {
    private func power(n: Int) -> Int {
        var s = 1
        for _ in 0..<n {
            s *= s
        }
        return s
    }
}

class Equation {
    
    private var x: Int
    private var n: Int
    
    init(x: Int, n: Int) {
        self.x = x
        self.n = n
    }
    
    private func minResult(n: Int) -> Float {
        return Float((-1).power(n) + self.x.power(n) / n)
    }
    
    private func result() -> Float {
        var s: Float = 0
        for i in 1...n {
            s += minResult(i)
        }
        return s
    }
}

let equation = Equation(x: 10, n: 20)
equation.result()