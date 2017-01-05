//: Playground - noun: a place where people can play

import Foundation
import UIKit

//class CarrierSubscription {
//    
//    let name: String
//    let countryCode: String
//    let number: String
//    unowned var user: User
//    weak var phone: Phone?
//    init(name: String, countryCode: String, number: String, user: User) {
//        self.name = name
//        self.countryCode = countryCode
//        self.number = number
//        self.user = user
//        self.user.subscriptions.append(self)
//        print("\(name) is initialized")
//    }
//    
//    deinit {
//        print("\(name) is being deallocated")
//    }
//}
//
//class User {
//    var name: String
//    var subscriptions: [CarrierSubscription] = []
//
//    private(set) var phones: [Phone] = []
//    func add(phone: Phone) {
//        phones.append(phone)
//        phone.owner = self
//    }
//    
//    init(name: String) {
//        self.name = name
//        print("User \(name) is inititalized")
//    }
//
//    deinit {
//        print("User \(name) is being deallocated")
//    }
//}
//
//class Phone {
//    
//    let model: String
//    weak var owner: User?
//    var carrierSubscription: CarrierSubscription?
//    
//    func provision(carrierSubscription: CarrierSubscription) {
//        self.carrierSubscription = carrierSubscription
//        carrierSubscription.phone = self
//        
//    }
//    
//    init(model: String) {
//        self.model = model
//        print("Phone \(model) is initialized")
//    }
//    
//    deinit {
//        print("Phone \(model) is being deallocated")
//    }
//}
//
//do {
//    let user1 = User(name: "John")
//    let iphone = Phone(model: "iPhone 6 Plus")
//    user1.add(phone: iphone)
//    let subscription1 = CarrierSubscription(name: "TelBel", countryCode: "0032", number: "31415926", user: user1)
//    iphone.provision(carrierSubscription: subscription1)
//
//}
//

protocol ADelegete: class {
    func test1()
}

class A {
    weak var delegate: ADelegete?
    init() {
        print("A is initialized")
    }
    deinit {
        print("A is initialzed")
    }
}

class B {
    unowned let a: A
    init(a: A) {
        self.a = a
        a.delegate = self
        print("B is inititalized")
    }
    
    deinit {
        print("B is deallocated")
    }
}

extension B: ADelegete {
    func test1() {
        print(#function)
    }
}

do {
    let a = A()
    let b = B(a: a)
}
