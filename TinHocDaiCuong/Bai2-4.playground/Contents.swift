//: Playground - noun: a place where people can play

import UIKit

//Tinh a^n voi a > 0

class Power {
    
    private var a: Double
    private var n: Double
    
    init(a: Double, n: Double) {
        self.a = a
        self.n = n
    }
    
    private var noValid: String {
        return "no valid"
    }
    
    private func calculation() -> String {
        if a < 0 {
            return noValid
        } else if a == 0 {
            return "\(0)"
        } else {
            return "Ket qua: \(exp(n * log(a)))"
        }
    }
}

let power = Power(a: 10, n: 2)
print(power.calculation())