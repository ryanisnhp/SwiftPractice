//
//  CarSelector.swift
//  FactoryPattern
//
//  Created by Lam Le Van on 7/26/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation

class CarSelector {
    class func selectCar(passengers: Int) -> String? {
        return createRentalCar(passengers)?.name
    }
}