//: Playground - noun: a place where people can play

import UIKit

//Giai phuong trinh bac 2: ax^2 + b^x + c
typealias Quadratic = (a2: Double, a1: Double, a0: Double)
class Equation {
    
    var quadratic: Quadratic
    init(quadratic: Quadratic) {
        self.quadratic = quadratic
    }

    private var isIdentifying: Bool {
        return quadratic.a0 != 0 && quadratic.a1 != 0 && quadratic.a2 != 0
    }
    
    private var delta: Double {
        return pow(quadratic.a1, 2) - 4 * quadratic.a2 * quadratic.a0
    }
    
    private var noSolution: String {
        return "He phuong trinh vo nghiem"
    }
    
    private var dual: Double {
        return (-quadratic.a1 / (2 * quadratic.a2))
    }
    
    private var x1: Double {
        return (-quadratic.a1 - sqrt(delta)) / (2 * quadratic.a2)
    }
    
    private var x2: Double {
        return (-quadratic.a1 + sqrt(delta)) / (2 * quadratic.a2)
    }
    
    private func calculation() -> String {
        if isIdentifying {
            if delta < 0 {
                return noSolution
            } else if delta == 0 {
                return "Nghiem kep: \(dual)"
            } else {
                return "x1 = \(x1), x2 = \(x2)"
            }
        } else {
            return "No invalid"
        }
    }
}

let equation = Equation(quadratic: (1, 1, 1))
equation.calculation()

class Disequation: Equation {
    
    private var noDisequation: String {
        return "No disequation"
    }
    
    private var nghiemDon: Double {
        return -quadratic.a2 / quadratic.a1
    }
    
    private override func calculation() -> String {
        if quadratic.a2 == 0 {
            if quadratic.a1 < 0 {
                return "Nghiem x < \(nghiemDon)"
            } else if quadratic.a1 == 0 {
                return "Khong phai bat phuong trinh"
            } else {
                return "Nghiem x > \(nghiemDon)"
            }
        } else if quadratic.a2 < 0 {
            if delta < 0 {
                return "Bat phuong trinh vo nghiem"
            } else if delta == 0 {
                return "Nghiem x = \(dual)"
            } else {
                return "\(x1) < x < \(x2)"
            }
        } else {
            if delta <= 0 {
                return "Bat phuong trinh vo so nghiem"
            } else {
                return "x < \(x1) hoac x > \(x2)"
            }
        }
    }
}

let disequation = Disequation(quadratic: (1, -3, 2))
disequation.calculation()



