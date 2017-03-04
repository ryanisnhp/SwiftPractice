//
//  CarViewModel.swift
//  MVVMDemo1
//
//  Created by LeVanLam on 2/18/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import Foundation

class CarViewModel {
    
    private var car: Car
    static let horsePowerKilowatt = 1.3102209
    
    var modelText: String {
        return car.model
    }
    
    var makeText: String {
        return car.make
    }
    var horsepowerText: String {
        let horsePower = Int(round(Double(car.kilowatts) * CarViewModel.horsePowerKilowatt))
        return "\(horsePower) HP"
    }
    var titleText: String {
        return "\(car.make) \(car.model)"
    }
    var photoURL: URL? {
        return URL(string: car.photoURL)
    }
    init(car: Car) {
        self.car = car
    }
}
