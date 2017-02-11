//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let thisYear = Calendar.current.component(Calendar.Component.year, from: Date())
print(thisYear)
let cal = Calendar.current
let comps2 = cal.dateComponents([.year, .month], from: Date())
let thisMonthh = comps2.year
print(thisMonthh)