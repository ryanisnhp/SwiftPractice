//
//  Venue.swift
//  RealmStarted
//
//  Created by Lam Le Van on 8/25/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation
import RealmSwift
import MapKit

class Venue: Object {
    
    dynamic var id = ""
    dynamic var name = ""
    dynamic var latitude: Float = 0
    dynamic var longitude: Float = 0
    dynamic var address = ""
    var coordinate: CLLocation {
        return CLLocation(latitude: Double(latitude), longitude: Double(longitude))
    }
    
    func primaryKey() -> String {
        return "id"
    }
}