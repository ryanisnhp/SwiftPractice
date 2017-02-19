//
//  ArtWork.swift
//  HonoluluArtDemo
//
//  Created by LeVanLam on 2/18/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit
import MapKit
import Contacts
import SwiftyJSON

struct Location {
    var lat: CLLocationDegrees
    var lng: CLLocationDegrees
    var origin: CLLocation {
        return CLLocation(latitude: lat, longitude: lng)
    }
    private let regionRadius: CLLocationDistance = 1000
    var centerMapOnLocation: MKCoordinateRegion {
        return MKCoordinateRegionMakeWithDistance(origin.coordinate, regionRadius * 2.0, regionRadius * 2.0)
    }
}

class Artworks {
    
    var artWorks: [Artwork] = []
    
    init(json: JSON) {
        artWorks = json.arrayValue.map({Artwork(json: $0)})
    }
}

class Artwork: NSObject {
    
    let artWorktitle: String
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(json: JSON) {
        artWorktitle = json["title"].stringValue
        locationName = json["location"].stringValue
        discipline = json["discipline"].stringValue
        let lat = json["latitude"].stringValue
        let lng = json["longitude"].stringValue
        coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(lat)!, longitude: CLLocationDegrees(lng)!)
    }
    
    func mapItem() -> MKMapItem {
        let addressDictionary = [String(CNPostalAddressStreetKey): subtitle as Any]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
    
    var pinColor: UIColor {
        switch discipline {
            case "Sculpture", "Plaque":
            return .red
            case "Mural", "Monument":
            return .purple
        default:
            return .green
        }
    }
}

extension Artwork: MKAnnotation {
    
    var subtitle: String? {
        return locationName
    }
    
    var title: String? {
        return artWorktitle
    }

}
