//: Playground - noun: a place where people can play
// References link: https://www.raywenderlich.com/138190/swift-algorithm-club-swift-tree-data-structure
import UIKit

class Node<T> {
    var value: T
    var children: [Node] = [] //add the children property
    weak var parent: Node? //add the parent property
    
    init(value: T) {
        self.value = value
    }
    
    func add(child: Node) {
        children.append(child)
        child.parent = self
    }
}

let beverages = Node(value: "beverages")
let hotBeverages = Node(value: "hot") //Node
let coldBeverages = Node(value: "cold") //Node
beverages.add(child: hotBeverages)
beverages.add(child: coldBeverages)

//parent: hot
let teaBeverages = Node(value: "tea") //Node
let coffeeBeverages = Node(value: "coffee") //Leaf
let cocoaBeverages = Node(value: "cocoa") //Leaf
hotBeverages.add(child: teaBeverages)
hotBeverages.add(child: coffeeBeverages)
hotBeverages.add(child: cocoaBeverages)

//parent: cold
let sodaBeverages = Node(value: "soda") //Node
let milkBeverages = Node(value: "milk") //Leaf
coldBeverages.add(child: sodaBeverages)
coldBeverages.add(child: milkBeverages)

//parent: tea
let blackBeverages = Node(value: "black") //Leaf
let greenBeverages = Node(value: "green") //Leaf
let chaiBeverages = Node(value: "chai") //Leaf
teaBeverages.add(child: blackBeverages)
teaBeverages.add(child: greenBeverages)
teaBeverages.add(child: chaiBeverages)

//parent: soda
let gingerAleBeverages = Node(value: "ginger ale") //Leaf
let bitterLemonBeverages = Node(value: "bitter lemond") //Leaf
sodaBeverages.add(child: gingerAleBeverages)
sodaBeverages.add(child: bitterLemonBeverages)

//Printing trees
print(beverages)

// Declared extension to your Node class
extension Node: CustomStringConvertible {
    //Declared the description property
    var description: String {
        //Declared text variable
        var text = "\(value)"
        //4
        if !children.isEmpty {
            text += " {" + children.map{$0.description}.joined(separator: ", ") + "} "
        }
        return text
    }
}

extension Node where T: Equatable {
    
    //if value is exits, return the node, if it does not exist, return nil
    func search(value: T) -> Node? {
        //If we found the value, return the self, which is the current node
        if value == self.value {
            return self
        }
        //If any of the nodes have a match, your if let statement will evaluate true and return the node
        for child in children {
            if let found = child.search(value: value) {
                return found
            }
        }
        //Return nil here to signify that you couldn't find a match
        return nil
    }
}

beverages.search(value: "cocoa") // returns the "cocoa" node
beverages.search(value: "chai") // returns the "chai" node
beverages.search(value: "bubbly") // returns nil
