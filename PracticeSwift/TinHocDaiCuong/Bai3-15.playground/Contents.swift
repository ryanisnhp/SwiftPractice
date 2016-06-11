//: Playground - noun: a place where people can play

import UIKit

//Liet ke cac so k = tong lap phuong cac chu so cua no
extension Int {
    private var cubic: Int {
        return self * self * self
    }
}

class NumberFound {
    
    private var x: Int
    init(x: Int) {
        self.x = x
    }
    
    private func numbers() -> [Int] {
        var numbers: [Int] = []
        var number = self.x
        while number > 0 {
            numbers.append(number % 10)
            number = number / 10
        }
        return numbers
    }
    
    private var checking: Bool {
        var s = 0
        for i in self.numbers() {
            s = s + i.cubic
        }
        return self.x == s
    }
}

final class Filter {
    static var maxNumber = 1000
    class func filter() {
        for i in 1...maxNumber {
            let numberFound = NumberFound(x: i)
            if numberFound.checking {
                print(i)
            }
        }
    }
}

Filter.filter()