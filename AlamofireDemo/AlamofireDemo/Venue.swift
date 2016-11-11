//
//  Venue.swift
//  AlamofireDemo
//
//  Created by Lam Le Van on 11/11/16.
//  Copyright © 2016 Asian Tech. All rights reserved.
//

import Foundation
import CoreLocation

struct Venue {
    
    enum Category {
        case Entertainment
        case Food
        case Nightlife
        case Shopping
        
        static var categories: [String: Category] = [
            "entertainment": Entertainment,
            "food": Food,
            "night life": Nightlife,
            "shopping": Shopping
        ]
        
        static func category(name: String) -> Category {
            return Category.categories[name]!
        }
    }
    
    var name: String = ""
    var coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    var category: Category = Category.Shopping
    
    init(response: NSDictionary?) {
        let dict = response?["response"] as? NSDictionary
        name = dict?["name"] as? String ?? ""
        if let coord = dict?["coordinates"] as? NSDictionary, lat = coord["lat"] as? Double, lng = coord["lng"] as? Double {
            coordinates = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        }
        if let categoryValue = dict?["category"] as? String {
            category = Category.category(categoryValue)
        }
    }
}
let JSON = "{\"name\": \"Coffee Macs\", \"coordinates\": {\"lat\": 33.33567, \"lng\": 43.554545}, \"category\": \"food\"}"
