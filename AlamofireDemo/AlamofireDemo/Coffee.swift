//
//  Coffee.swift
//  AlamofireDemo
//
//  Created by Lam Le Van on 12/9/16.
//  Copyright © 2016 Asian Tech. All rights reserved.
//

import UIKit
import SwiftyJSON

class Coffee {
    
    var name = ""
    var coordinate: Coordinate
    var lat: Double
    var lng: Double
    
    init(json: JSON) {
        name = json["name"].stringValue
        
        coordinate = Coordinate(json: json["coordinates"])
        lat = coordinate.lat
        lng = coordinate.lng
    }
}


struct Coordinate {
    
    var lat = 0.0
    var lng = 0.0
    
    init(json: JSON) {
        lat = json["lat"].doubleValue
        lng = json["lng"].doubleValue
    }
}