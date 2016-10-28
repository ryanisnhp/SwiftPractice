//
//  RentalCar.swift
//  FactoryPattern
//
//  Created by Lam Le Van on 7/26/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation

class RentalCar {
    
    private var nameBV: String
    private var passengersBV: Int
    private var priceBV: Float
    
    private init(name: String, passengers: Int, price: Float) {
        self.nameBV = name
        self.passengersBV = passengers
        self.priceBV = price
    }
    
    final var name: String {
        get {
            return nameBV
        }
    }
    
    final var passengers: Int {
        get {
            return passengersBV
        }
    }
    
    final var pricePerDay: Float {
        get {
            return priceBV
        }
    }
    
    class func createRentalCar(passengers: Int) -> RentalCar? {
        var car: RentalCar?
        switch passengers {
        case 0...3 {
            car = Compact()
            
            }
        }
    }
}

class Compact: RentalCar {
    var name = "VW Golf"
    var passengers = 3
    var pricePerDay: Float = 20
}

class Sports : RentalCar {
    var name = "Porsche Boxter"
    var passengers = 1
    var pricePerDay: Float = 100
}

class SUV : RentalCar {
    var name = "Cadillac Escalade"
    var passengers = 8
    var pricePerDay: Float = 75
}

class Minivan : RentalCar {
        var name = "Chevrolet Express"
        var passengers = 14
        var pricePerDay:Float = 40
}
