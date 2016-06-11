//: Playground - noun: a place where people can play

import UIKit

//Tinh PI
private let epsilon = 0.001

extension Int {
    private func power(n: Int) -> Int {
        var s = 1
        for _ in 0..<n {
            s *= s
        }
        return s
    }
}
private func pi() -> Double {
    
    func bieuThuc(n: Int) -> Double {
        return (1.0 / Double(2 * n + 1)) * Double((-1).power(n))
    }
    
    func checking(n: Int) -> Double {
        return 4.0 / Double(2 * n + 1)
    }
    
    var s = 0.0
    var n = 0
    while checking(n) > epsilon {
        s += bieuThuc(n)
        n = n + 1
    }
    return s
}
print(pi())