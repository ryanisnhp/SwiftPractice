//: Playground - noun: a place where people can play

import UIKit

//135 = 1! + 3! + 5!

extension Int {
    private func giaiThua() -> Int {
        var s = 1
        for i in 1...self {
            s *= i
        }
        return s
    }
    
    private mutating func numbers() -> [Int] {
        var numbers: [Int] = []
        while self > 0 {
            numbers.append(self % 10)
            self = self / 10
        }
        return numbers
    }
}

struct Founded {
    private var n: Int
    private var checking: Bool {
        let s = 
    }
}

