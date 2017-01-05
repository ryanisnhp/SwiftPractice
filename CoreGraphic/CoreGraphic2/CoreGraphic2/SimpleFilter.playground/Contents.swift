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
//Gold color
let darkGoldColor = UIColor(red: 0.6, green: 0.5, blue: 0.15, alpha: 1.0)
let midGoldColor = UIColor(red: 0.86, green: 0.73, blue: 0.3, alpha: 1.0)
let lightColor = UIColor(red: 1.0, green: 0.98, blue: 0.9, alpha: 1.0)

//Lower Ribbon
var lowerRibbonPath = UIBezierPath()
lowerRibbonPath.move(to: CGPoint(x: 0, y: 0 ))
lowerRibbonPath.addLine(to: CGPoint(x: 40, y: 0))
lowerRibbonPath.addLine(to: CGPoint(x: 78, y: 70))
lowerRibbonPath.addLine(to: CGPoint(x: 38, y: 70))
lowerRibbonPath.close()
UIColor.red.setFill()
lowerRibbonPath.fill()
//Clasp
var claspPath = UIBezierPath(roundedRect: CGRect(x: 36, y: 62, width: 43, height: 20), cornerRadius: 5.0)
claspPath.lineWidth = 5
darkGoldColor.setStroke()
claspPath.stroke()
//Medallion
var medallionPath = UIBezierPath(ovalIn: CGRect(origin: CGPoint(x: 8, y: 72), size: CGSize(width: 100, height: 100)))
context?.saveGState()

medallionPath.addClip()

let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: [darkGoldColor.cgColor, midGoldColor.cgColor, lightColor.cgColor] as CFArray, locations: [0, 0.51, 1])
context?.drawLinearGradient(gradient!, start: CGPoint(x: 40, y: 40), end: CGPoint(x: 40, y: 162), options: [])

context?.restoreGState()

//Upper ribbon
var upperRibbonPath = UIBezierPath()
upperRibbonPath.move(to: CGPoint(x: 68, y: 0))
upperRibbonPath.addLine(to: CGPoint(x: 108, y: 0))
upperRibbonPath.addLine(to: CGPoint(x: 78, y: 70))
upperRibbonPath.addLine(to: CGPoint(x: 38, y: 70))
upperRibbonPath.close()
UIColor.blue.setFill()
upperRibbonPath.fill()

//Number one
let numberOne: NSString = "1"
let numberOneRect = CGRect(x: 47, y: 100, width: 50, height: 50)
let font = UIFont(name: "Academy Engraved LET", size: 60)
let textStyle = NSMutableParagraphStyle.default
let numberOneAttributes = [
    NSFontAttributeName: font!,
    NSForegroundColorAttributeName: darkGoldColor
]
numberOne.draw(in: numberOneRect, withAttributes: numberOneAttributes)

//This code must always be at the end of the playground
//This code must always be at the end of the playground
let image = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext()
//Add Shadow
let shadow: UIColor = UIColor.black.withAlphaComponent(0.8)
let shadowOffset = CGSize(width: 2.0, height: 2.0)
let shadowBlurRadius: CGFloat = 5

context?.setShadow(offset: shadowOffset, blur: shadowBlurRadius, color: shadow.cgColor)
