 //: Playground - noun: a place where people can play
 
 import UIKit
 //
 //    private var isIdentifying: Bool {
 //        return self.x <= self.n
 //    }
 
 private func C(x: Int, _ n: Int) -> Int {
    
    var isIdentifying: Bool {
        return x <= n
    }
    if isIdentifying {
        if x == 0 {
            return 1
        } else if x == n {
            return 1
        } else {
            return C(x - 1, n - 1) + C(x, n - 1)
        }
    }
    return Int()
 }
 C(9, 10)