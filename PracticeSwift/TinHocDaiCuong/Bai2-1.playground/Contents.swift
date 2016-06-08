//: Playground - noun: a place where people can play

import UIKit

//Giai he phuong trinh

typealias Equation = (Double, Double, Double)

class EquationSystem {
    
    private var firstEquation: Equation
    private var secondEquation: Equation
    
    init(first: Equation, second: Equation) {
        self.firstEquation = first
        self.secondEquation = second
    }
    
    private var determinant: Double {
        return firstEquation.0 * secondEquation.1 - firstEquation.1 - secondEquation.0
    }
    
    private var dx: Double {
        return firstEquation.1 * secondEquation.2 - firstEquation.2 * secondEquation.1
    }
    
    private var dy: Double {
        return firstEquation.0 * secondEquation.2 - firstEquation.2 * secondEquation.0
    }
    
    private func result() -> String {
        if determinant != 0 {
            return "Nghiem duy nhat: (\(dx / determinant), \(dy / determinant))"
        } else {
            if dx == 0 || dy == 0 {
                return "He phuong trinh vo so nghiem"
            } else {
                return "He phuong trinh vo nghiem"
            }
        }
    }
}

let system = EquationSystem(first: (4, 5, 2), second: (30, 2, 1))
print(system.result())