//: Playground - noun: a place where people can play

import UIKit

class Node<T> {
    
    var value: T
    var leftChild: Node?
    var rightChild: Node?
    
    init(value: T) {
        self.value = value
    }
}

indirect enum BinaryTree<T: Comparable> {
    case empty
    case node(BinaryTree, T, BinaryTree)
    
    //Challenge: Implementing Inserttion
    mutating func naiveInsert(newValue: T) {
        guard case .node(var left, let value, var right) = self else {
            self = .node(.empty, newValue, .empty)
            return
        }
        if newValue < value {
            left.naiveInsert(newValue)
        } else {
            right.naiveInsert(newValue)
        }
    }
    
}

//(5 * (a - 10)) + (-4 * (3 / b))
let node5 = BinaryTree.node(.empty, "5", .empty)
let nodeA = BinaryTree.node(.empty, "a", .empty)
let node10 = BinaryTree.node(.empty, "10", .empty)
let node4 = BinaryTree.node(.empty, "4", .empty)
let node3 = BinaryTree.node(.empty, "3", .empty)
let nodeB = BinaryTree.node(.empty, "b", .empty)

// intermediate nodes on the left
let Aminus10 = BinaryTree.node(nodeA, "-", node10)
let timesLeft = BinaryTree.node(node5, "*", Aminus10)

// intermediate nodes on the right
let minus4 = BinaryTree.node(.empty, "-", node4)
let divide3AndB = BinaryTree.node(node3, "/", nodeB)
let timesRight = BinaryTree.node(minus4, "*", divide3AndB)

//root node
let tree = BinaryTree.node(timesLeft, "+", timesRight)

extension BinaryTree: CustomStringConvertible {
    
    var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
        case .empty:
            return ""
        }
    }
    
    var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
    
    private func newTreeWithInsertedValue(newValue: T) -> BinaryTree {
        switch self {
        case .empty:
            return .node(.empty, newValue, .empty)
        case let .node(left, value, right):
            if newValue < value {
                return .node(left.newTreeWithInsertedValue(newValue), value, right)
            } else {
                return .node(left, value, right.newTreeWithInsertedValue(newValue))
            }
        }
    }
    
    mutating func insert(newValue: T) {
        self = newTreeWithInsertedValue(newValue)
    }
    
    func traverseInOrder(process: (T) -> ()) {
        switch self {
            // 1
        case .empty:
            return
            // 2
        case let .node(left, value, right):
            left.traverseInOrder(process)
            process(value)
            right.traverseInOrder(process)
        }
    }
    
    func traversePreOrder(process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            process(value)
            left.traversePreOrder(process)
            right.traversePreOrder(process)
        }
    }
    
    func traversePostOrder(process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traversePostOrder(process)
            right.traversePostOrder(process)
            process(value)
        }
    }
    
    func search(searchValue: T) -> BinaryTree? {
        switch self {
        case .empty:
            return nil
        case let .node(left, value, right):
            if searchValue == value {
            return self
        }
        if searchValue < value {
            return left.search(searchValue)
        } else {
            return right.search(searchValue)
            }
        }
    }
}

var binaryTree: BinaryTree<Int> = .empty
binaryTree.insert(7)
binaryTree.insert(10)
binaryTree.insert(2)
binaryTree.insert(1)
binaryTree.insert(5)
binaryTree.insert(9)

binaryTree.traverseInOrder { print($0) }
binaryTree.search(10)

//OPERATORS
func *(left: String, right: Int) -> String {
    if right <= 0 {
        return ""
    }
    var result = left
    for _ in 1..<right {
        result += left
    }
    return result
}
"a"*6

func +(left: [Double], right: [Double]) -> [Double] {
    var sum = [Double](count: left.count, repeatedValue: 0.0)
    for (i, _) in left.enumerate() {
        sum[i] = left[i] + right[i]
    }
    return sum
}
func +(left: [Int], right: [Int]) -> [Int] {
    var sum = [Int](count: left.count, repeatedValue: 0)
    for (i, _) in left.enumerate() {
        sum[i] = left[i] + right[i]
    }
    return sum
}
[1, 2] + [3, 4]

func <<<T> (inout left: [T], right: [T]) -> [T] {
    left.appendContentsOf(right)
    return left
}

//Custom operator
infix operator ** { associativity left precedence 160 }
func ** (left: Double, right: Double) -> Double {
    return pow(left, right)
}
2 ** 3
infix operator **= {associativity right precedence 90}
func **= (inout left: Double, right: Double) {
    left = left ** right
}

//Custom operators with protocol and method
protocol RegularExpressionMatchable {
    func match(pattern: String, options: NSRegularExpressionOptions) throws -> Bool
}

extension String: RegularExpressionMatchable {
    func match(pattern: String, options: NSRegularExpressionOptions = []) throws -> Bool {
        let regex = try NSRegularExpression(pattern: pattern, options: options)
        return regex.numberOfMatchesInString(self, options: [], range: NSRange(location: 0, length: 0.distanceTo(utf16.count))) != 0
    }
}

infix operator =~ {associativity left precedence 130}
func =~<T: RegularExpressionMatchable>(left: T, right: String) -> Bool {
    return try! left.match(right, options: [])
}
let cocoaClassPattern = "^[A-Z]{2,}[A-Za-z0-9]+$"

try? "NSHipster".match(cocoaClassPattern)
"NSHipster" =~ cocoaClassPattern

//User of mathematical Symbols
prefix operator √ {}
prefix func √ (number: Double) -> Double {
    return sqrt(number)
}
√4