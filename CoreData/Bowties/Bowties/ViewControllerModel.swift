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
    
    private var currentBowtie: Bowtie?
    var senderData: ((Bowtie?) -> Void)?
    
    var bowties: [Bowtie] = []
    
    init() {
        getData()
    }
    
    private func getData() {
        guard let managedContext = AppDelegate.managedContext else { return }
        //Retrieve test bowtie
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Bowtie")
        request.predicate = NSPredicate(format: "searchKey != nil", argumentArray: nil)
        do {
            if try managedContext.count(for: request) > 0 {
                if let bowties = try managedContext.fetch(request) as? [Bowtie] {
                    self.bowties = bowties
                }
                return
            }
            guard let path = Bundle.main.path(forResource: "SampleData", ofType: "plist"), let datas = NSArray(contentsOfFile: path) else { return }
            for data in datas {
                guard let entity = NSEntityDescription.entity(forEntityName: "Bowtie", in: managedContext) else { return }
                if let dict = data as? NSDictionary {
                    let bowtie = Bowtie(entity: entity, insertInto: managedContext, dict: dict)
                    bowties.append(bowtie)
                }
            }
            try managedContext.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func bowtieForSegment(at title: String) {
        currentBowtie = bowties.filter({$0.searchKey == title}).first
        senderData?(currentBowtie)
    }
    
    func updateBowtie() {
        guard let managedContext = AppDelegate.managedContext, let currentBowtie = currentBowtie else { return }
        let times = currentBowtie.timesWorn
        currentBowtie.timesWorn = times + 1
        currentBowtie.lastWorn = NSDate()
        do {
            try managedContext.save()
            senderData?(currentBowtie)
        } catch {}
    }
    
    func updateRating(string: String) {
        guard let managedContext = AppDelegate.managedContext,
            let currentBowtie = currentBowtie,
            let rating = Double(string) else { return }
        currentBowtie.rating = rating
        do {
            try managedContext.save()
            senderData?(currentBowtie)
        } catch {}

    }
    
    func showAlert(save: @escaping (String) -> Void, cancel: ((UIAlertAction?) -> Void)?) -> UIAlertController {
        let alert = UIAlertController(title: "New Rating",
                                      message: "Rate this bow tie",
                                      preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: cancel)
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let textField = alert.textFields?.first, let text = textField.text else { return }
            save(text)
        }
        alert.addTextField(configurationHandler: nil)
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        return alert
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
            self.photoData = photoData! as NSData
        }
        if let lastWorn = dict["lastWorn"] as? Date {
            self.lastWorn = lastWorn as NSDate
            
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
    
    var image: UIImage? {
        guard let photoData = photoData as Data? else { return nil }
        return UIImage(data: photoData)
    }
    
    var ratingLabel: String {
        return "Rating: \(Double(rating))/5"
    }
    
    var timesWornLabel: String {
        return "# times worn: \(Int(timesWorn))"
    }
    
    var lastWornLabel: String {
        guard let lastWorn = lastWorn else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        return "Last worn: " + dateFormatter.string(from: lastWorn as Date)
    }
    
    var isHidden: Bool {
        return !Bool(isFavorite)
    }
    
    var color: UIColor? {
        return tintColor as? UIColor
    }
}
