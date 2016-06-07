//: Playground - noun: a place where people can play

import UIKit

//Tính chu kỳ dao động của con lắc, T = 2*pi*squrt(l/g)

class Cycle {
    
    static var gravitation = 9.8
    private var long: Double
    init(long: Double) {
        self.long = long
    }
    
    func cycle() -> Double {
        return 2 * M_PI * sqrt(self.long / Cycle.gravitation)
    }
}

let cycle = Cycle(long: 10)
print(cycle.cycle())