//: Playground - noun: a place where people can play

import UIKit

//Tinh shx va chx

struct CosHyperbolique {
    subscript(x: Double) -> Double {
        return (exp(x) + exp(-x)) / 2
    }
}

struct SinHyperbolique {
    subscript(x: Double) -> Double {
        return exp(x)/2 - exp(-x)/2
    }
}

let ch = CosHyperbolique()
print(ch[10])
let sh = SinHyperbolique()
print(sh[10])

