//: Playground - noun: a place where people can play

import UIKit

var evens: [Int] = []
for i in 1...10 {
    if i % 2 == 0 {
        evens.append(i)
    }
}
print(evens)

func isEven(number: Int) -> Bool {
    return number % 2 == 0
}
evens = Array(1...10).filter(isEven)
print(evens)

evens = Array(1...10).filter{$0%2==0}
print(evens)

//The magic behind filter
func myFilter<T>(source: [T], predicate: (T)->Bool) -> [T] {
    var result: [T] = []
    for i in source {
        if predicate(i) {
            result.append(i)
        }
    }
    return result
}

//evens = myFilter(source: Array(1...19), predicate: isEven)
evens = myFilter(source: Array(1...19), predicate: {$0 % 2 == 0})
print(evens)

//Functional reduct
var evenSum = Array(1...10).filter(isEven).reduce(0, { (total, number) -> Int in
    total + number
})
print(evenSum)

//The magic behind reduce
extension Array {
    func myReduce<T, U>(seed: U, combiner: (U, T) -> U) -> U {
        var current = seed
        for item in self {
            if let item = item as? T {
                current = combiner(current, item)
            }
        }
        return current
    }
}

//Building an index

let words = ["Cat", "Chicken", "fish", "Dog",
             "Mouse", "Guinea Pig", "monkey"]
typealias Entry = (String, [String])
func buildIndex(words: [String]) -> [Entry] {
    var result: [Entry] = []
    var letters: [String] = []
    for word in words {
        if !letters.contains(word.firstLetter.uppercased()) {
            letters.append(word.firstLetter.uppercased())
        }
    }
    for letter in letters {
        var wordsForLetter: [String] = []
        for word in words {
            if letter == word.firstLetter.uppercased() {
                wordsForLetter.append(word)
            }
        }
        result.append((letter, wordsForLetter))
    }
    return result
}

extension String {
    var firstLetter: String {
        if self.characters.count > 0 {
            return String(self[self.startIndex])
        }
        return ""
    }
}
print(buildIndex(words: words))

let size = CGSize(width: 120, height: 200)
UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
let context = UIGraphicsGetCurrentContext()

//This code must always be at the end of the playground
let image = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext()
