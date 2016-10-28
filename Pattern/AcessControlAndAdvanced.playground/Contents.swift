//: Playground - noun: a place where people can play

import UIKit

let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits
print(invertedBits)

struct Vector2D {
    var x = 0.0
    var y = 0.0
}

func +(left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

prefix func -(vector: Vector2D) -> Vector2D {
    return Vector2D(x: -vector.x, y: -vector.y)
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive

func += (inout left: Vector2D, right: Vector2D) {
    left = left + right
}

func == (left: Vector2D, right: Vector2D) -> Bool {
    return left.x == right.x && left.y == right.y
}

func != (left: Vector2D, right: Vector2D) -> Bool {
    return !(left == right)
}

prefix func +++ (inout vector: Vector2D) -> Vector2D {
    vector += vector
    return vector
}