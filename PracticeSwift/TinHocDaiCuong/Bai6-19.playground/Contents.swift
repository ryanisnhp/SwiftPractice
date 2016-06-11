//: Playground - noun: a place where people can play

import UIKit

//Kaprekar

class Kaprekar {
    
    private var n: Int
    
    init(n: Int) {
        self.n = n
    }
    
    private func numbers() -> [Int] {
        var numbers: [Int] = []
        var number = self.n
        while number / 10 > 0 {
            numbers.append(number % 10)
            number = number / 10
        }
        return numbers
    }
    
    private var tangDan: [Int] {
        return numbers().sort({ (s1, s2) -> Bool in
            s1 < s2
        })
    }
    
    private var giamDan: [Int] {
        return numbers().sort({ (s1, s2) -> Bool in
            s1 > s2
        })
    }
    
    private func numberOfSorted(completion: (maxNumber: Int, minNumber: Int) -> Void) {
        func numberSorted(numbers: [Int]) -> Int {
            var s = 0
            for i in numbers {
                s = s * 10 + i
            }
            return s
        }
        completion(maxNumber: numberSorted(giamDan), minNumber: numberSorted(tangDan))
    }
    
    private func checking() -> Bool {
        var s = 0
        self.numberOfSorted { (maxNumber, minNumber) -> Void in
            s = maxNumber - minNumber
        }
        return s == self.n
    }
    
}


private func printNumber() {
    for i in 1...10000000 {
        let check = Kaprekar(n: i)
        if check.checking() {
            print(i)
        }
    }
}

let check = Kaprekar(n: 1253)
check.tangDan
check.giamDan
check.numbers()
check.numberOfSorted { (maxNumber, minNumber) -> Void in
    print(maxNumber)
    print(minNumber)
}

