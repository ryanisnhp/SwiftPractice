//
//  PriceSelector.swift
//  FactoryPattern
//
//  Created by Lam Le Van on 7/26/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation

class PriceSelector {
    class func calculatePrice(passengers: Int, days: Int) -> Float? {
        let car = createRentalCar(passengers)
        return car == nil ? nil : car!.pricePerDay * Float(days)

    }
}