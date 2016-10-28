//: Playground - noun: a place where people can play

import UIKit

class SortArray {
    
    private var numbers: [Int] = []
    
    private var isIdentifying: Bool {
        return self.numbers.count > 0
    }
    
    init(numbers: [Int]) {
        self.numbers = numbers
    }
    
    private func lessSort() -> [Int] {
        if isIdentifying {
            
            var d = 0
            var tg = 0
            
            func phanTule() {
                for i in 0..<self.numbers.count {
                    if self.numbers[i] % 5 == 0 && self.numbers[i] % 2 == 1 {
                        tg = self.numbers[i]
                        self.numbers[i] = self.numbers[d]
                        self.numbers[d] = tg
                        d = d + 1
                    }
                }
            }
            
            func phanTuChan() {
                d = self.numbers.count - 1
                for var i = self.numbers.count - 1; i >= 0; i = i - 1 {
                    if self.numbers[i] % 5 == 0 && self.numbers[i] % 2 == 0 {
                        tg = self.numbers[i]
                        self.numbers[i] = self.numbers[d]
                        self.numbers[d] = tg
                        d = d - 1
                    }
                }
            }
            
            phanTule()
            phanTuChan()
            return self.numbers

        }
        return []
    }
}

let less = SortArray(numbers: [1, 20, 15, 6, 5, 7, 7, 8,8, 5, 10, 15 ])
less.lessSort()

