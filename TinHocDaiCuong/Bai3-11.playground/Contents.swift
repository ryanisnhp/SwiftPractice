//: Playground - noun: a place where people can play

import UIKit

//So tuyet hao
struct UocSo {
    
    private var x: Int
    
    private var uocSo: [Int] {
        var dayUocSo: [Int] = []
        for i in 1..<self.x {
            if self.x % i == 0 {
                dayUocSo.append(i)
            }
        }
        return dayUocSo
    }
}

struct SoTuyetHao {
    
    private var x: Int
    
    private var condition: Bool {
        let number = UocSo(x: x)
        var s = 0
        for i in number.uocSo {
            s = s + i
        }
        return s == number.x
    }
}

struct DaySoTuyetHao {
    
    static func daySoTuyetHao() {
        for i in 1...10000 {
            let soTuyetHao = SoTuyetHao(x: i)
            if soTuyetHao.condition {
                print(soTuyetHao.x)
            }
        }
    }
}

DaySoTuyetHao.daySoTuyetHao()