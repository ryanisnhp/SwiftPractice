//: Playground - noun: a place where people can play

import UIKit

//135 = 1! + 3! + 5!
class FindingNumber {
    
    private var n: Int
    
    init(n: Int) {
        self.n = n
    }
    
    private var numbers: [Int] {
        var numbers: [Int] = []
        while n > 0 {
            numbers.append(n % 10)
            n /= 10
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
        for i in self.numbers {
            s += giaiThua(i)
        }
        return s == self.n
    }
}

private func finding() {
    for i in 1...1000000 {
      let s = FindingNumber(n: i)
        if s.checking {
            print(i)
        }
    }
}

finding()

