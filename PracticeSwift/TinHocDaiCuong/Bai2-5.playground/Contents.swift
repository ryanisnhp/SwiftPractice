//: Playground - noun: a place where people can play

import UIKit

class Max {
    
    private var a: Double
    private var b: Double
    private var c: Double
    private var d: Double
    
    init(a: Double, b: Double, c: Double, d: Double) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
    }
    
    private var max: Double {
        var max = self.a
        if max < self.b {
            max = self.b
        }
        if max < self.c {
            max = self.c
        }
        if max < self.d {
            max = self.d
        }
        return max
    }
}

let max = Max(a: 1, b: 2, c: 10, d: 4)
max.max

//Extend

class Maximum {
    
    private var numbers: [Double]
    
    init(numbers: [Double]) {
        self.numbers = numbers
    }
    
    private var max: Double {
        var max = self.numbers[0]
        for number in self.numbers {
            if max < number {
                max = number
            }
        }
        return max
    }
}

let maximum = Maximum(numbers: [100222, 2, 4, 6, 7, 8, 10, 10])
maximum.max