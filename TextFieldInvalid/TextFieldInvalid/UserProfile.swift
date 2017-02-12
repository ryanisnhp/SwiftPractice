//
//  UserProfile.swift
//  TextFieldInvalid
//
//  Created by Lam Le Van on 2/12/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

let kUserDefault = UserDefaults.standard

class UserProfile {
    
    static let instance = UserProfile()
    
    private var _firstName = ""
    private var _lastName = ""
    private var _age = ""
    
    var validate: ((Bool) -> Void)?
    var firstName: String {
        set {
            _firstName = newValue
            invalid()
        }
        get {
            return _firstName
        }
    }
    
    var lastName: String {
        set {
            _lastName = newValue
            invalid()
        }
        get {
            return _lastName
        }
    }
    
    var age: String {
        set {
            _age = newValue
            invalid()
        }
        get {
            return _age
        }
    }
    
    func saveUserProfile() {
        kUserDefault.set(firstName, forKey: "firstName")
        kUserDefault.set(lastName, forKey: "lastName")
        kUserDefault.set(age, forKey: "age")
    }
    
    func getUserProfile() {
        if let firstName = kUserDefault.value(forKey: "firstName") as? String {
            self.firstName = firstName
        }
        if let lastName = kUserDefault.value(forKey: "lastName") as? String {
            self.lastName = lastName
        }
        if let age = kUserDefault.value(forKey: "age") as? String {
            self.age = age
        }
        invalid()
    }
    
    private func invalid() {
        validate?(lastName.length*firstName.length*age.length>0)
    }
    
}

extension String {
    var length: Int {
        return self.characters.count
    }
}
