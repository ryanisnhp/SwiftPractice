//: Playground - noun: a place where people can play

import UIKit
//
//7. Viãút mäüt thuí tuûc nháûp vaìo 1 giaï trë n nháûp vaìo 1 giaï trë (7≤n≤10) vaì 1 maíng A gäöm n pháön tæí kiãøu Integer. Haîy tênh täøng caïc pháön tæí tæì pháön tæí ám âáöu tiãn âãún cuäúi maíng nãúu khäng thç tênh täøng caïc pháön tæì naìo coï 3 chæî säú.

class SumArray {
    
    private var inputs: [Int] = []
    private var n: Int
    
    init(inputs: [Int], n: Int) {
        self.inputs = inputs
        self.n = n
    }
    
    private var isIdentifying: Bool {
        return self.n >= 7 && self.n <= 10 && self.inputs.capacity == self.n
    }
    
    private func isHundered(number: Int) -> Bool {
        return number > 99 && number < 1000
    }
    
    private var arrayHasNegativeNumber: Bool {
        for i in self.inputs {
            if i < 0 {
                return true
            }
        }
        return false
    }
    private func sumFromNegative() -> Int {
        var index = 0
        var sum = 0
        for i in 0..<self.inputs.count {
            if self.inputs[i] < 0 {
                index = i
                break
            }
        }
        for i in index..<self.inputs.count {
            sum = sum + self.inputs[i]
        }
        return sum
    }
    
    private func sumHunderedNumber() -> Int {
        var sum = 0
        for i in self.inputs {
            if isHundered(i) {
                sum = sum + i
            }
        }
        return sum
    }
    
    private func sum() -> String {
        if isIdentifying {
            if arrayHasNegativeNumber {
                return "\(sumFromNegative())"
            } else {
                return "\(sumHunderedNumber())"
            }
        }
        return "Error"
    }
}

let sum = SumArray(inputs: [1, 2, -300, 400], n: 5)
print(sum.sum())