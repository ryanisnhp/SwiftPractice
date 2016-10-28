//: Playground - noun: a place where people can play

import UIKit

//Tao ra bang cuu chuong

//10 bang
// 3 he so

class Multiplication {
    
    private var x: Int
    
    init(x: Int) {
        self.x = x
    }
    
    private func multiply(y: Int) {
        if y > 0 {
            print("\(x)x\(y)=\(x*y)")
        }
    }
    
    private func print1() {
        for j in 1...9 {
            multiply(j)
        }
    }
}

pri