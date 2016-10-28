//: Playground - noun: a place where people can play

import UIKit

//Giai phuong trinh trung phuong ax^4 + bx^2 + c = 0

class Equation {
    
    private var a: Double
    private var b: Double
    private var c: Double
    
    init(a: Double, b: Double, c: Double) {
        self.a = a
        self.b = b
        self.c = c
    }
    
    private var isIdentifying: Bool {
        return a != 0 && b != 0 && c != 0
    }
    
    private var delta: Double {
        return b * b - 4 * a * c
    }
    
    private var voNghiem: String {
        return "vo nghiem"
    }

    private var nghiemBacHai: Double {
        return -b/(2*a)
    }
    
    private var nghiemBacHai1: Double {
        return (-b - sqrt(delta)) / (2 * a)
    }
    
    private var nghiemBacHai2: Double {
        return  (-b + sqrt(delta)) / (2 * a)
    }
    
    private var th1: String {
        return "vo nghiem"
    }
    
    private var th2: String {
        return "S={\(-sqrt(nghiemBacHai2)), \(sqrt(nghiemBacHai2))}"
    }
   
    private var th3: String {
        return "S={\(-sqrt(nghiemBacHai1)), \(sqrt(nghiemBacHai1)), \(-sqrt(nghiemBacHai2)), \(sqrt(nghiemBacHai2))}"
    }
    
    private func calculation() -> String {
        if isIdentifying {
            if delta < 0 {
                return voNghiem
            } else if delta == 0 {
                if nghiemBacHai < 0 {
                    return voNghiem
                } else if nghiemBacHai == 0 {
                    return "S={\(nghiemBacHai)}"
                } else {
                    return "S={\(-sqrt(nghiemBacHai)), \(sqrt(nghiemBacHai))}"
                }
            } else {
                if nghiemBacHai2 < 0 {
                    return th1
                } else {
                    if nghiemBacHai1 < 0 {
                        return th2
                    } else {
                        return th3
                    }
                }
            }
        } else {
            return "No valid"
        }
    }
}
