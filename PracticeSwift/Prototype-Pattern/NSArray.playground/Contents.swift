//: Playground - noun: a place where people can play

import UIKit

class Person: NSObject, NSCopying {
    
    private(set) var name: String
    private(set) var country: String
    
    init(name: String, country: String) {
        self.name = name
        self.country = country
        super.init()
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        return Person(name: self.name, country: self.country)
    }
}

var data = NSMutableArray(objects: 10, "iOS", Person(name: "Joe", country: "USA"))
var copiedData = NSMutableArray(array: data as [AnyObject], copyItems: true)
print(data)
print(copiedData)
data[0] = 20
data[1] = "MacOS"
(data[2] as! Person).name = "Alice"
print("Identity: \(data === copiedData)")
if let name = (copiedData[2] as? Person)?.name {
    print("0: \(copiedData[0]) 1: \(copiedData[1]) 2: \(name)")
}
if let name = (data[2] as? Person)?.name {
    print("0: \(data[0]) 1: \(data[1]) 2: \(name)")
}

