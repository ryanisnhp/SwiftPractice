//: Playground - noun: a place where people can play

import UIKit

class Person: NSObject, NSCopying {
    
    var name: String
    var country: String
    
    init(name: String, country: String) {
        self.name = name
        self.country = country
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        return Person(name: self.name, country: self.country)
    }
}

func deepCopy(data: [AnyObject]) -> [AnyObject] {
    return data.map({ (item) -> AnyObject in
        if (item is NSCopying && item is NSObject) {
            return (item as! NSObject).copy()
        } else {
            return item
        }
    })
}

var people = [Person(name: "Joe", country: "France"), Person(name: "Bob", country: "USA")]
var otherPeople = deepCopy(people)
people[0].country = "UK"
print("Country: \(otherPeople[0].country)")