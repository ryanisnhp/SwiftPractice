//: Playground - noun: a place where people can play

import UIKit

class Number {
    private var numbers: [Int] = []
    
    subscript(index: Int) -> Int {
        return self.numbers[index]
    }

    init(numbers: [Int]) {
        self.numbers = numbers
    }
    
    func count() -> Int {
        return self.numbers.count
    }
    
    func toString() {
        for number in self.numbers {
            print(number)
        }
    }
    
    func sort() -> [Int] {
        return self.numbers.sort({ (s1, s2) -> Bool in
            return s1 < s2
        })
    }
}

extension Number {
    
    func replace(index: Int, value: Int) {
        self.numbers.removeAtIndex(index)
        self.numbers.insert(value, atIndex: index)
    }
    
    func quickSort(left: Int, right: Int) {
        var i = left
        var j = right
        let x = self[left]
        var y1 = 0
        var y2 = 0
        while i <= j {
            while self[i] < x && i < right {
                i = i + 1
            }
            while self[j] > x && j > left {
                j = j - 1
            }
            if i <= j {
                y1 = self[i]
                y2 = self[j]
                self.replace(i, value: y2)
                self.replace(j, value: y1)
                i = i + 1
                j = j - 1
            }
        }
        if left < j {
            quickSort(left, right: j)
        }
        if i < right {
            quickSort(i, right: right)
        }
    }
}

let numbers = Number(numbers: [10, 9, 8, 7, 6, 5, 4, 3, 2, 1])
numbers.quickSort(0, right: numbers.count() - 1)

let numbers2 =  Number(numbers: [10, 9, 8, 7, 6, 5, 4, 3, 2, 1])
numbers2.sort()