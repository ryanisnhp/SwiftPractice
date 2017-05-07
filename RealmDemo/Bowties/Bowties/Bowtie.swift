//
//  Bowtie.swift
//  Bowties
//
//  Created by Le Van Lam on 5/3/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class Bowtie: Object {
    dynamic var name = ""
    dynamic var rating = 0
//    dynamic var tintColor: TintColor?
    dynamic var imageName = ""
    dynamic var lastWorn = Date()
    dynamic var timeWorn: Int32 = 0
    dynamic var isFavorite = false
}

class TintColor {
    
}

extension Bowtie {
    
//    convenience init(entity: NSEntityDescription, insertInto managedContext: NSManagedObjectContext, dict: NSDictionary) {
//        self.init(entity: entity, insertInto: managedContext)
//        if let name = dict["name"] as? String {
//            self.name = name
//        }
//        if let searchKey = dict["searchKey"] as? String {
//            self.searchKey = searchKey
//        }
//        if let rating = dict["rating"] as? Double {
//            self.rating = rating
//        }
//        if let tintColorDict = dict["tintColor"] as? NSDictionary {
//            self.tintColor = colorFromDict(dict: tintColorDict)
//        }
//        if let imageName = dict["imageName"] as? String,  let image = UIImage(named: imageName) {
//            let photoData = UIImagePNGRepresentation(image)
//            self.photoData = photoData! as NSData
//        }
//        if let lastWorn = dict["lastWorn"] as? Date {
//            self.lastWorn = lastWorn as NSDate
//            
//        }
//        if let timesWorn = dict["timesWorn"] as? Int32 {
//            self.timesWorn = timesWorn
//        }
//        if let isFavorite = dict["isFavorite"] as? Bool {
//            self.isFavorite = isFavorite
//        }
//    }
    
    func colorFromDict(dict: NSDictionary) -> UIColor {
        var red: NSNumber = 0
        var green: NSNumber = 0
        var blue: NSNumber = 0
        if let redN = dict["red"] as? NSNumber {
            red = redN
        }
        if let greenN = dict["green"] as? NSNumber {
            green = greenN
        }
        if let blueN = dict["blue"] as? NSNumber {
            blue = blueN
        }
        let color = UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0,
                            blue: CGFloat(blue)/255,
                            alpha: 1)
        return color
    }
}
