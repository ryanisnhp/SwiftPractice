//: Playground - noun: a place where people can play

import UIKit

//tinh tong va tich cua so nguyen duong
class Natural {
    
    private var natural: Int
    
    init(natural: Int) {
        self.natural = natural
    }
    
    private func numbers() -> [Int] {
        var numebers: [Int] = []
        var natural = self.natural
        while natural > 0 {
            numebers.append(natural % 10)
            natural = natural/10
        }
        return numebers
    }
    
    private var tong: Int {
        var tong = 0
        for i in self.numbers() {
            tong += i
        }
        return tong
    }
    
    private var tich: Int {
        var tich = 1
        for i in self.numbers() {
            tich *= i
        }
        return tich
    }
}

let natu = Natural(natural: 13994)
natu.numbers()
natu.tong
natu.tich