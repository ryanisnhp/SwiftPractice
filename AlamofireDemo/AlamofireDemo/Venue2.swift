//
//  Venue2.swift
//  AlamofireDemo
//
//  Created by Lam Le Van on 11/11/16.
//  Copyright © 2016 Asian Tech. All rights reserved.
//

import ObjectMapper
import CoreLocation

class Venue2: Mappable {
    
    var name: String?
    var coor: Coor?
    var shopping: String?
    
    required init?(_ map: Map) {
        mapping(map)
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        coor <- map["coordinates"]
        shopping <- map["category"]
    }

}

class Coor: Mappable {

    var cor: CLLocationCoordinate2D?
    var lat: Double?
    var lng: Double?
    
    required init?(_ map: Map) {
        mapping(map)
    }
    
    func mapping(map: Map) {
        lat <- map["lat"]
        lng <- map["lng"]
        cor = CLLocationCoordinate2D(latitude: lat!, longitude: lng!)
    }
}