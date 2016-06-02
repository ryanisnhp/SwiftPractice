//: Playground - noun: a place where people can play

import UIKit

//Subscript
struct TimeTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let timeTable = TimeTable(multiplier: 5)
timeTable[9]

struct Testing {
    let test: Int

}