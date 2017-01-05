//: Playground - noun: a place where people can play

import UIKit

//Equatable
//struct Complex<T: SignedNumber> {
//    let real: T
//    let imaginary: T
//}
//
//extension Complex: Equatable {}
//
//func ==<T> (lhs: Complex<T>, rhs: Complex<T>) -> Bool {
//    return lhs.real == rhs.real && lhs.imaginary == rhs.imaginary
//}
//
//let a = Complex<Double>(real: 1.0, imaginary: 2.0)
//let b = Complex<Double>(real: 1.0, imaginary: 2.0)
//
//a == b
//a != b

struct CSSSelector {
    let selector: String
    
    struct Specificity {
        let id: Int
        let `class` : Int
        let element: Int
        
        init(_ components: [String]) {
            var (id, `class`, element) = (0, 0, 0)
            for token in components {
                if token.hasPrefix("#") {
                    id = id + 1
                } else if token.hasPrefix(".") {
                    `class` = `class` + 1
                } else {
                    element = element + 1
                }
            }
            self.id = id
            self.`class` = `class`
            self.element = element
        }
    }
    let specificity: Specificity

    init(_ string: String) {
        self.selector = string
        
        //Naive tokenization, ignoring operators, pseudo-selectors, and `style=`
        let components: [String] = self.selector.components(separatedBy: CharacterSet.whitespaces)
        self.specificity = Specificity(components)
    }
}

extension CSSSelector: Equatable {}

// MARK: Equatable
func ==(lhs: CSSSelector, rhs: CSSSelector) -> Bool {
    return lhs.selector == rhs.selector
}

extension CSSSelector.Specificity: Comparable {}

func <(lhs: CSSSelector.Specificity, rhs: CSSSelector.Specificity) -> Bool {
    return lhs.id < rhs.id ||
    (lhs.id == rhs.id && lhs.`class` < rhs.`class`) ||
    (lhs.id == rhs.id && lhs.`class` == rhs.`class` && lhs.element < rhs.element)
}

func ==(lhs: CSSSelector.Specificity, rhs: CSSSelector.Specificity) -> Bool {
    return lhs.id == rhs.id &&
    lhs.`class` == rhs.`class` &&
    lhs.element == rhs.element
}

let a: CSSSelector = CSSSelector("#logo")
let b: CSSSelector = CSSSelector("html body #logo")
let c: CSSSelector = CSSSelector("body div #logo")
let d: CSSSelector = CSSSelector(".container #logo")

a.specificity
a.selector
b.specificity
b.selector
c.specificity
c.selector
d.specificity
d.selector

b == c
b.specificity == c.specificity
c.specificity < a.specificity
d.specificity > c.specificity

// MARK: Hashable
struct Binomen {
    let genus: String
    let species: String
}

extension Binomen: Hashable {
    
    public var hashValue: Int {
        return genus.hashValue^species.hashValue
    }
}
//Equatable
func ==(lhs: Binomen, rhs: Binomen) -> Bool {
    return lhs.genus == rhs.genus && lhs.species == rhs.species
}

var commonNames: [Binomen: String] = [:]
let binomen: Binomen = Binomen(genus: "Canis", species: "lupis")

commonNames[binomen] = "Grey Wolf"
commonNames[Binomen(genus: "Canis", species: "rufus")] = "Red Wolf"
commonNames[Binomen(genus: "Canis", species: "latrans")] = "Coyote"
commonNames[Binomen(genus: "Canis", species: "aureus")] = "Golden Jackal"
print(commonNames)

print(binomen.genus.hashValue)
print(binomen.species.hashValue)
print(binomen.hashValue)
if let name = commonNames[binomen] {
    print(name)
}

//extension CFString: Hashable {
//    public var hashValue: Int {
//        return self.hashValue
//    }
//}
//
//public func ==(lhs: CFString, rhs: CFString) -> Bool {
//    return (lhs as String) ==
//}

//let a1 = kCTForegroundColorAttributeName
//let b1 = kCTForegroundColorAttributeName
//print(a1 == b1)
