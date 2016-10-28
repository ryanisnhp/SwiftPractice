//: Playground - noun: a place where people can play

import UIKit

class SumArray {
    
    private var numbers: [Int] = []
    
    init(numbers: [Int]) {
        self.numbers = numbers
    }
    
    private var invertNumbers: [Int] {
        var invertNumbers: [Int] = []
        for var i = self.numbers.count - 1; i >= 0; i = i - 1 {
            invertNumbers.append(self.numbers[i])
        }
        return invertNumbers
    }
    
    private func resultCalculation() -> (sum: Int, mul: Int) {
        
        var positiveNumbers: [Int] {
            var positiveNumbers: [Int] = []
            for i in self.numbers {
                if i > 0 {
                    positiveNumbers.append(i)
                }
            }
            return positiveNumbers
        }
        
        var sum = 0
        var mul = 1
        for i in positiveNumbers {
            sum = sum + i
            mul = mul * i
        }
        return (sum, mul)
    }
    
    private func sort() -> [Int] {
        let sortNumbers = self.numbers
        return sortNumbers.sort { (s1, s2) -> Bool in
            return s1 < s2
        }
    }
}

let numbers = SumArray(numbers: [1, 2, 3, 6, 4,0])
numbers.invertNumbers
numbers.resultCalculation()
numbers.sort()