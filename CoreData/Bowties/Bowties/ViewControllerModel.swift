//
//  ViewControllerModel.swift
//  Bowties
//
//  Created by Le Van Lam on 4/30/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ViewControllerModel {
    
    typealias Completion = ([Bowtie]) -> Void
    private var completion: Completion
    
    init(completion: @escaping Completion) {
        self.completion = completion
    }
    
    func getData() {
        guard let managedContext = AppDelegate.managedContext else { return }
        //Retrieve test bowtie
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Bowtie")
        request.predicate = NSPredicate(format: "searchKey != nil", argumentArray: nil)
        do {
            if try managedContext.count(for: request) > 0 {
                if let bowties = try managedContext.fetch(request) as? [Bowtie] {
                    completion(bowties)
                }
                return
            }
            guard let path = Bundle.main.path(forResource: "SampleData", ofType: "plist"), let datas = NSArray(contentsOfFile: path) else { return }
            var bowties: [Bowtie] = []
            for data in datas {
                guard let entity = NSEntityDescription.entity(forEntityName: "Bowtie", in: managedContext) else { return }
                if let dict = data as? NSDictionary {
                    let bowtie = Bowtie(entity: entity, insertInto: managedContext, dict: dict)
                    bowties.append(bowtie)
                }
            }
            try managedContext.save()
            completion(bowties)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}

extension Bowtie {
    convenience init(entity: NSEntityDescription, insertInto managedContext: NSManagedObjectContext, dict: NSDictionary) {
        self.init(entity: entity, insertInto: managedContext)
        if let name = dict["name"] as? String {
            self.name = name
        }
        if let searchKey = dict["searchKey"] as? String {
            self.searchKey = searchKey
        }
        if let rating = dict["rating"] as? Double {
            self.rating = rating
        }
        if let tintColorDict = dict["tintColor"] as? NSDictionary {
           self.tintColor = colorFromDict(dict: tintColorDict)
        }
        if let imageName = dict["imageName"] as? String,  let image = UIImage(named: imageName) {
            let photoData = UIImagePNGRepresentation(image)
            self.photoData = photoData
        }
        if let lastWorn = dict["lastWorn"] as? Date {
            self.lastWorn = lastWorn
            
        }
        if let timesWorn = dict["timesWorn"] as? Int32 {
            self.timesWorn = timesWorn
        }
        if let isFavorite = dict["isFavorite"] as? Bool {
            self.isFavorite = isFavorite
        }
    }
    
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
