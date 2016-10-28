//: Playground - noun: a place where people can play

import UIKit

//Tinh goc OAB

struct Point {
    private var x: Double
    private var y: Double
}

struct Vector {
    private var A1: Point
    private var A2: Point
    private var origin: (x: Double, y: Double) {
        return (A2.x - A1.x, A2.y - A1.y)
    }
    private var length: Double {
        return sqrt((origin.x * origin.x) + (origin.y * origin.y))
    }
}

func multiply(vector1: Vector, vector2: Vector) -> Double {
    return vector1.origin.0 * vector2.origin.0 + vector1.origin.1 * vector2.origin.1
}

struct Corner {
    private var vector1: Vector
    private var vector2: Vector
    
    private var cos: Double {
        return multiply(vector1, vector2: vector2) / (vector1.length * vector2.length)
    }
    
    private var corner: Double {
        return acos(cos)
    }
}

let OA = Vector(A1: Point(x: 19, y: 29), A2: Point(x: 1, y: 39))
let OB = Vector(A1: Point(x: 22, y: 33), A2: Point(x: 10, y: 3))

let corner = Corner(vector1: OA, vector2: OB)
corner.cos
corner.corner