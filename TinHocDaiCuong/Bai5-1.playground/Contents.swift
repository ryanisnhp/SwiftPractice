//: Playground - noun: a place where people can play

import UIKit

let kUserDefault = NSUserDefaults.standardUserDefaults()

private func saveNumber(n: Int) {
    kUserDefault.setInteger(n, forKey: "\(n)")
    kUserDefault.synchronize()
}

private func getNumber(n: Int) -> Int {
    return kUserDefault.integerForKey("\(n)")
}

private func removeNumber(n: Int) {
    kUserDefault.removeObjectForKey("\(n)")
}

extension Int {
    func isIdentifying() -> Bool {
        return self > 0
    }
}

class Fibo {
    
    static let fibo0 = 1
    static let fibo1 = 1
    
    subscript(index: Int) -> Int {
        var s = 0
        if index.isIdentifying() {
            if index == 1 || index == 2 {
                s = 1
                saveNumber(index)
            } else {
                s = Fibo()[index - 1] + Fibo()[index - 2]
            }
        }
        return s
    }
}

func printFibonacci(n: Int) {

    for i in 1...n {
        print(Fibo()[i])
    }
}
