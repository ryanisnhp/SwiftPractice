//
//  Venue.swift
//  MVVMDemo
//
//  Created by Su Nguyen T. on 2/22/17.
//  Copyright © 2017 AsianTech Co., Ltd. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

class Venue {
	var name: String = ""
	var thumbnailURL = ""
	var thumbnailImage: UIImage? = nil
	var photos = [String]()
	var location: CLLocation?
	var id: String = ""
	
	convenience init(name: String?, location: CLLocation?, id: String?) {
		self.init()
		self.name = name ?? ""
		self.location = location ?? CLLocation()
		self.id = id ?? ""
	}
	
	static func getRestaurantPathWith(limit: Int, offset: Int) -> String {
		return Strings.PrefixURL + "\(limit)" + Strings.SuffixURL + "\(offset)"
	}
	
	static func getPhotoPath(id: String) -> String {
		return Strings.PrefixAPIPhoto + id + Strings.SuffixAPIPhoto
	}
}

extension Venue {
	class func venues(withData data: Data?) -> [Venue]? {
		var venues: [Venue] = []
		if let data = data {
			let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
			guard let dic: [String : Any] = json as? [String : Any] else { return nil }
			guard let response = dic["response"] as? [String: Any] else { return nil }
			guard let groups = response["groups"] as? [[String: Any]] else { return nil }
			guard let items = groups[0]["items"] as? [[String: Any]] else { return nil }
			for item in items {
				guard let venue = item["venue"] as? [String: Any] else { return nil }
				let venueObject = Venue()
				venueObject.name = (venue["name"] as? String) ?? ""
				venueObject.id = (venue["id"] as? String) ?? ""
				venues.append(venueObject)
			}
			return venues
		}
		return nil
	}
}
