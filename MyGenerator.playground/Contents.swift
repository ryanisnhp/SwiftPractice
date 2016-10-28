//: Playground - noun: a place where people can play

import UIKit

struct SortedCollection<T: Comparable> {
    
    private var contents: [T] = []
    
    init<S: SequenceType where S.Generator.Element == T>(_ sequence: S) {
        contents = sequence.sort()
    }
    
    func indexOf(value: T) -> Int? {
        if let index = contents.indexOf(value) where index < contents.count {
            return contents[index] == value ? index : nil
        }
        return nil
    }
    
    mutating func insert(value: T) {
        contents.insert(value, atIndex: contents.indexOf(value)!)
    }
    
    mutating func remove(value: T) -> T? {
        if let index = indexOf(value) {
            return contents.removeAtIndex(index)
        }
        return nil
    }
}

extension SortedCollection : SequenceType {
    
    typealias Generator = AnyGenerator<T>
    func generate() -> Generator {
        var index = 0
        return AnyGenerator {
            if index < self.contents.count {
                let content = self.contents[index]
                index = index + 1
                return content
            }
            return nil
        }
    }
}

extension SortedCollection: CollectionType {
    
    typealias Index = Int
    
    var startIndex: Int {
        return 0
    }
    
    var endIndex: Int {
        return count
    }
    
    subscript(i: Int) -> T {
        return contents[i]
    }
}
