//: Playground - noun: a place where people can play

import UIKit



func parisFromDictionary<KeyType, ValueType>(dictionary: [KeyType: ValueType]) -> [(KeyType, ValueType)] {
    return Array(dictionary)
}


protocol ZeroValueable {
    static func zeroEquivalentValue() -> Self
}

struct Coord: ZeroValueable {
    let x: Int
    let y: Int
    static func zeroEquivalentValue() -> Coord {
        return Coord(x: 0, y: 0)
    }
}

enum Result<T, U> {
    case Success(T)
    case Failure(U)
}
let aSuccess: Result<Int, String> = .Success(123)
let aFailure: Result<Int, String> = .Failure("temperature too high")

struct Queue<T> {}

let a1: Queue<Int> = Queue()

func duplicate<T>(item: T, numberOfTimes n: Int) -> [T] {
    var buffer: [T] = []
    for _ in 0..<n {
        buffer.append(item)
    }
    return buffer
}

extension Result {
    //Tranform the value of the "Result" using one of two mapping functions
    func transform<V>(left: T -> V, right: U -> V) -> V {
        switch self {
        case .Success(let value): return left(value)
        case .Failure(let value): return right(value)
        }
    }
}

let a = duplicate(52, numberOfTimes: 10)
//let b = duplicate<String>("foo", numberOfTimes: 5)

protocol FoodEatingType {
    typealias Food
    
    var isSatiated: Bool {get}
    func feed(food: Food)
}

//class Koala : FoodEatingType {
//    var foodLevel = 0
//    var isSatiated : Bool { return foodLevel < 10 }
//    
//    // Koalas are notoriously picky eaters
//    func feed(food: Eucalyptus) {
//        // ...
//        if !isSatiated {
//            foodLevel += 1
//        }
//    }
//}

class GourmandWolf<FoodType>: FoodEatingType {
    var isSatiated: Bool {return false}
    func feed(food: FoodType) {
        
    }
}

func findLargestInArray<T where T: Comparable>(array: Array<T>) -> T? {
    if array.isEmpty {
        return nil
    }
    var soFar: T = array[0]
    for i in 1..<array.count {
        soFar = array[i] > soFar ? array[i] : soFar
    }
    return soFar
}

let arrayToTest = ["fdsf", "fefefec", "vdvdf", "trefe", "beereref"]
if let result = findLargestInArray(arrayToTest) {
    print("The largest element in the array is \(result)")
} else {
    print("array is empty")
}

protocol Foo {
    typealias Key
    typealias Element
}

protocol Bar {
    typealias RawGeneratorType
}
//
//func example<T: Foo, U, V where V: Foo, V: Bar, T.Key == V.RawGeneratorType, U == V.Element>(arg1: T, arg2: U, arg3: V) -> U {
//    
//}

extension Array where Element: Hashable, Element: Comparable {
    
}

extension CollectionType where Self.Generator.Element : Comparable {
    func largestValue() -> Generator.Element? {
        guard var largestSoFar = first else {
            return nil
        }
        for item in self {
            if item > largestSoFar {
                largestSoFar = item
            }
        }
        return largestSoFar
    }
}
[1, 2, 3, 4, 5].largestValue()

protocol SimpleInitable {init()}

func emptyInstances<T: SimpleInitable>(count: Int) -> [T] {
    return (0 ..< count).map {_ in T() }
}

//protocol Calcutable {
//    func +(lsh: Self, rhs: Self) -> Self
//    func -(lsh: Self, rhs: Self) -> Self
//    func *(lsh: Self, rhs: Self) -> Self
//    func /(lsh: Self, rhs: Self) -> Self
//}
//
//struct Complex<T: SignedNumberType> {
//    var real: T
//    var imaginary: T
//}
//
//extension Complex: Calcutable{}
//
//func +<T>(lsh: Complex<T>, rhs: Complex<T>) -> Complex<T> {
//    return Complex(real: lsh.real + rhs.real, imaginary: rhs.imaginary + lsh.imaginary)
//}
//func -(lsh: Complex<T>, rhs: Complex<T>) -> Complex<T> {
//    
//}
//func *(lsh: Complex<T>, rhs: Complex<T>) -> Complex<T> {
//    
//}
//func /(lsh: Complex<T>, rhs: Complex<T>) -> Complex<T> {
//    
//}
//


struct OrderedDictionary<KeyType: Hashable, ValueType> {
    
    typealias ArrayType = [KeyType]
    typealias DictionaryType = [KeyType: ValueType]
    private var dictionary: OrderedDictionary
    
    mutating func insert(value: ValueType, forKey key: KeyType, atIndex index: Int) -> ValueType?
    {
        var adjustedIndex = index
        
        // 2
        let existingValue = self.dictionary[key]
        if existingValue != nil {
            // 3
            let existingIndex = find(self.array, key)!
            
            // 4
            if existingIndex < index {
                adjustedIndex--
            }
            self.array.removeAtIndex(existingIndex)
        }
        
        // 5
        self.array.insert(key, atIndex:adjustedIndex)
        self.dictionary[key] = value
        
        // 6
        return existingValue
    }
}
