//: Playground - noun: a place where people can play

import UIKit

/*
 A linked list is a sequence of data item, where each item is referred to as a nod
 There are twom main types of linkd lists: Singly linked list and doubly linked list.
 */

//Basic node class
public class Node<T> {
    //A node needs a value associated with it
    var value: T
    //Next: each node needs a pointer to the next node in the list
    var next: Node?
    //Previous: To avoid ownership cycles, we declare the previous ponter to be weak. If you have a node A that is followed by node B in the list, the A points to B but aloso B points to A. In certain circumstances, this ownership cycle can cause nodes to be kept alive event after you deleted them. You don't want that. so we make one of the pointers weak to break the cycle.
    weak var previous: Node?
    
    init(value: T) {
        self.value = value
    }
}

//Linked List
public class LinkedList<T> {
    fileprivate var head: Node<T>?
    fileprivate var tail: Node<T>?
    
    //Empty
    public var isEmpty: Bool {
        return head == nil
    }
    
    //First
    public var first: Node<T>? {
        return head
    }
    
    //Last
    public var last: Node<T>? {
        return tail
    }
    
    //Append
    public func append(value: T) {
        //1
        let newNode = Node(value: value)
        //2
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        }
            //3
        else {
            head = newNode
        }
        tail = newNode
    }
}

let dogBreeds = LinkedList<String>()
dogBreeds.append(value: "Labrador")
dogBreeds.append(value: "Bulldog")
dogBreeds.append(value: "Beagle")
dogBreeds.append(value: "Husky")
print(dogBreeds)

//This isn't very helpful. To display a more readable output string, you can make LinkedList adopt the CustomStringConvertable protocol. To do this, add the following just below the implementation of your LinkedList class.
extension LinkedList: CustomStringConvertible {
    public var description: String {
        var text = "["
        var node = head
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil {
                text += ", "
            }
        }
        //5
        return text + "]"
    }
    
    
    //Accesing Nodes
    public func nodeAt(index: Int) -> Node<T>? {
        //1
        if index >= 0 {
            var node = head
            var i = index
            //2
            while node != nil {
                if i == 0 {
                    return node
                }
                i -= 1
                node = node?.next
            }
        }
        return nil
    }
    
    //Removing all nodes
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    public func remove(node: Node<T>) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next //Update the next pointer if you are not removing the first node in the list
        } else {
            head = next //Update the head pointer if you are removing the first node in the list
        }
        next?.previous = prev //Update the previous pointer to the previous pointer of the deleted node
        if next == nil {
            tail = prev //Update the tail if you are removing the last node in the list.
        }
        //Assign nil to the removed nodes previous and next pointers.
        node.previous = nil
        node.next = nil
        
        //6
        return node.value //Return the value for the removed node
    }
    
    var count: Int {
        var count = 0
        var node = head
        while node != nil {
            count = count + 1
            node = node?.next
        }
        return count
    }
}


let numbers = LinkedList<Int>()
numbers.append(value: 1)
numbers.append(value: 2)
numbers.append(value: 4)
print(numbers.count)
print(dogBreeds.count)

