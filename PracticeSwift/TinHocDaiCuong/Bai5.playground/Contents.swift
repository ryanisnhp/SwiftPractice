//: Playground - noun: a place where people can play

import UIKit

//Tinh chu vi ba canh cua tam giac

class Triangle {
    
    private var a: Float
    private var b: Float
    private var c: Float
    
    init(a: Float, b: Float, c: Float) {
        self.a = a
        self.b = b
        self.c = c
    }
    
    private func isTriangle() -> Bool {
        return (a+b)>c && (a+c)>b && (b+c)>a
    }
    
    private var perimeterHalf: Float? {
        if isTriangle() {
            return (a + b + c) / 2
        }
        return nil
    }
    
    private func arcarea() -> String {
        if let p = perimeterHalf {
            return "Dien tich: \(sqrt(p * (p-a)*(p-b)*(p-c)))"
        } else {
            return "Not invalid"
        }
    }

}

let triangle = Triangle(a: 3, b: 4, c: 5)
triangle.perimeterHalf