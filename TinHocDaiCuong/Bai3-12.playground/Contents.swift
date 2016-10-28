//: Playground - noun: a place where people can play

import UIKit

//Tim n! sao cho n! > M

class TimGiaiThua {
    
    private var m: Int
    
    init(m: Int) {
        self.m = m
    }
    
    private func giaithua(n: Int) -> Int {
        if n == 0 {
            return 1
        } else {
            var t = 1
            for i in 1...n {
                t *= i
            }
            return t
        }
    }
    private var founded: String {
        var found = 0
        while giaithua(found) < self.m {
            found += 1
        }
        return "\(found)!"
    }
}

let timGiaiThua = TimGiaiThua(m: 20)
timGiaiThua.founded