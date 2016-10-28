//: Playground - noun: a place where people can play

import UIKit

//Nhap so nguyen to < n
struct SoNguyenTo {
    private var x: Int
    private var checking: Bool {
        for i in 2..<x {
            if (x % i) == 0 {
                return false
            }
        }
        return true
    }
}

struct LietKe {
    private var max: Int
    private func filter() {
        for i in 2...max {
            if SoNguyenTo(x: i).checking {
                print(i)
            }
        }
    }
}

LietKe(max: 1000).filter()