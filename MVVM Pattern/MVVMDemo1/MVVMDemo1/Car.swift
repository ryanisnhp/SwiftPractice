//
//  Car.swift
//  MVVMDemo1
//
//  Created by LeVanLam on 2/15/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import Foundation

//Model
class Car {
    var model: String?
    var make: String?
    var horsepower: Int?
    var photoURL: String?
    
    init(model: String, make: String, horsepower: Int, photoURL: String) {
        self.model = model
        self.make = make
        self.horsepower = horsepower
        self.photoURL = photoURL
    }
}

//View Model
class CarViewModel {
    
    private var car: Car
    
    var modelText: String? {
        return car.model
    }
    var makeText: String? {
        return car.make
    }
    var horsepowerText: String? {
        guard let horsepowerText = car.horsepower else {
            return nil
        }
        return "\(horsepowerText) HP"
    }
    
    var titleText: String? {
        guard let make = car.make, let model = car.model else {
            return nil
        }
        return "\(make) \(model)"
    }
    var photoURL: URL? {
        guard let photoURL = car.photoURL else {
            return nil
        }
        return URL(string: photoURL)
    }
    
    init(car: Car) {
        self.car = car
    }
    
}
