//: Playground - noun: a place where people can play

import UIKit

func swapToValues<T>(inout a: T, inout _ b: T) {
    let temporary = a
    a = b
    b = temporary
}

var a = "2"
var b = "b"
swapToValues(&a, &b)

struct Stack<T> {
    var items: [T] = []
    mutating func push(item: T) {
        self.items.append(item)
    }
    mutating func pop() -> T {
        return self.items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")

extension Stack {
    var topItem: T? {
        return self.items.isEmpty ? nil : self.items.first
    }
}

class SomeClass {
    
}

class SomeProtocol {
    
}

func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    // function body goes here
}

func findIndex<T: Equatable>(array: [T], _ valueToFind: T) -> Int? {
    for (index, value) in array.enumerate() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let stringIndex = findIndex(["Mike", "Malcolm", "Andrea"], "Andrea")

protocol Container {
    typealias ItemType
    mutating func append(item: ItemType)
    var count: Int {get}
    subscript(i: Int) -> ItemType {get}
}

protocol Comparable1 {
    typealias Type
    func findIndex<Type: Equatable>(array: [Type], _ valueToFind: Type) -> Int?
}

struct IntStack<T>: Container, Comparable1 {
    var items: [T] = []
    mutating func push(item: T) {
        self.items.append(item)
    }
    mutating func pop() -> T {
        return self.items.removeLast()
    }
    
    typealias ItemType = T
    mutating func append(item: ItemType) {
        self.items.append(item)
    }
    var count: Int {
        return self.items.count
    }
    subscript(i: Int) -> ItemType {
        return self.items[i]
    }
    
    typealias Type = Int
    
    func findIndex<Type : Equatable>(array: [Type], _ valueToFind: Type) -> Int? {
        for (index, value) in array.enumerate() {
            if value == valueToFind {
                return index
            }
         }
        return nil
    }
}

struct Complex<T: SignedNumberType> {
    let real: T
    let imaginary: T
}

extension Complex: Equatable {}

func ==<T>(lhs: Complex<T>, rhs: Complex<T>) -> Bool {
    return lhs.real == rhs.real && lhs.imaginary == rhs.imaginary
}

let test1 = Complex<Double>(real: 1.3, imaginary: 4.6)
let test2 = Complex<Double>(real: 1.3, imaginary: 4.6)
if test1 == test2 {
    print("Equatable")
}
//
//protocol Testingtable {
//    func ==(lhs: Self, rhs: Self) -> Bool
//    func !=(lhs: Self, rhs: Self) -> Bool
//}

//protocol Equatable {
//    func !=(lhs: Self, rhs: Self) -> Bool
//}

struct Article {
    let title: String
    let body: String
}
extension Article: Equatable {}

func ==(lhs: Article, rhs: Article) -> Bool {
    return lhs.body == rhs.body && rhs.title == lhs.title
}

func !=(lhs: Article, rhs: Article) -> Bool {
    return !(lhs == rhs)
}

let article1 = Article(title: "1", body: "2")
let article2 = Article(title: "2", body: "2")
if article1 == article2 {
    print("Equatable")
}


