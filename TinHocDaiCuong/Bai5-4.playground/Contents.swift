//: Playground - noun: a place where people can play

import UIKit

class AddArray {
    
    private var A: [Int] = []
    private var B: [Int] = []
    
    init(A: [Int], B: [Int]) {
        self.A = A
        self.B = B
    }
    
    private var C: [Int] {
        
        var C: [Int] = []
        
        if self.A.count <= self.B.count {
            for i in 0..<self.A.count {
                C.append(self.A[i])
                C.append(self.B[i])
            }
            for i in self.A.count..<self.B.count {
                C.append(self.B[i])
            }
        } else {
            for i in 0..<self.B.count {
                C.append(self.A[i])
                C.append(self.B[i])
            }
            for i in self.B.count..<self.A.count {
                C.append(self.A[i])
            }
        }
        return C
    }
}

let add = AddArray(A: [1, 3, 4], B: [4, 4, 4, 4, 5])
add.C