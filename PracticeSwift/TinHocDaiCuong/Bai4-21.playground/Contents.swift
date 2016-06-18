//: Playground - noun: a place where people can play

import UIKit

//135 = 1! + 3! + 5!
class FindingNumber {
    
    private var n: Int
    
    init(n: Int) {
        self.n = n
    }
    
    private func numbers() -> [Int] {
        var numbers: [Int] = []
        var s = n
        while s > 0 {
            numbers.append(s % 10)
            s /= 10
        }
        return numbers
    }
    
    private func giaiThua(a: Int) -> Int {
        if a == 0 {
            return 1
        } else {
            var s = 1
            for i in 1...a {
                s *= i
            }
            return s
        }
    }
    
    private var checking: Bool {
        var s = 0
        for i in self.numbers() {
            s += giaiThua(i)
        }
        return s == self.n
    }
}

func finding() {
    for i in 1...5000 {
        if FindingNumber(n: i).checking {
            print(i)
        }
    }
}
finding()