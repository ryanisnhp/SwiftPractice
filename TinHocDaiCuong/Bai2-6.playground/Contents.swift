//: Playground - noun: a place where people can play

import UIKit

//Xac dinh tam giac

class Triangle {
    
    private var a: Double
    private var b: Double
    private var c: Double
    
    init(a: Double, b: Double, c: Double) {
        self.a = a
        self.b = b
        self.c = c
    }
    
    private var isTriangle: Bool {
        return (a+b)>c && (a+c)>b && (b+c)>a
    }
    
    private var equilateralRightAngle: Bool {
        return equilateral && rightAngle
    }
    
    private var isosceles: Bool {
        return (a == b) || (a == c) || (b == c)
    }
    
    private var equilateral: Bool {
        return (a == b) && (a == c) && (c == b)
    }
    
    private var rightAngle: Bool {
        return isRightAngleCondition(a, b: b, c: c)||isRightAngleCondition(b, b: c, c: a)||isRightAngleCondition(c, b: a, c: b)
    }
    
    private func isRightAngleCondition(a: Double, b: Double, c: Double) -> Bool {
        return pow(a, 2) + pow(b, 2) == pow(c, 2)
    }
    
    private func identifying() -> String {
        if isTriangle {
            if isosceles {
                return "Tam giac deu"
            } else {
                if equilateralRightAngle {
                    return "Tam giac vuong can"
                } else {
                    if rightAngle {
                        return "Tam giac vuong"
                    } else {
                        if equilateral {
                            return "Tam giac can"
                        } else {
                            return "Tam giac thuong"
                        }
                    }
                }
            }
        } else {
            return "Not triangle"
        }
    }
}

let triangle = Triangle(a: 1, b: 2, c: 1)
triangle.identifying()