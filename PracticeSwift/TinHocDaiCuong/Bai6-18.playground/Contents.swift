//: Playground - noun: a place where people can play

import UIKit

//Phep toan logic

enum Logic {
    case AND(Bool, Bool)
    case OR(Bool, Bool)
    case NOT(Bool)
    case NAND(Bool, Bool)
    case XOR(Bool, Bool)
}

class LogicTable {
    
    private var logic: Logic
    
    init(logic: Logic) {
        self.logic = logic
    }
    
    private func calculate() {
        switch logic {
        case .AND(let x, let y): print("\(x) And \(y) is \(x && y)")
        case .OR(let x, let y): print("\(x) OR \(y) is \(x || y)")
        case .NOT(let x): print("!\(x) is \(!x)")
        case .NAND(let x, let y): print("\(x) NAND \(y) is \(!(x || y))")
        case .XOR(let x, let y): print("\(x) XOR \(y) is \(x == y ? false: true)")
        }
    }
}
