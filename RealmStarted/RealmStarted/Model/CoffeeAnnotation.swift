//
//  CoffeeAnnotation.swift
//  RealmStarted
//
//  Created by Lam Le Van on 8/25/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation
import MapKit

class CoffeeAnnotation: NSObject, MKAnnotation {
    
    let coffeeTitle: String
    let subTitle: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, subTitle: String, coordinate: CLLocationCoordinate2D) {
        self.coffeeTitle = title
        self.subTitle = subTitle
        self.coordinate = coordinate
    }
    
}