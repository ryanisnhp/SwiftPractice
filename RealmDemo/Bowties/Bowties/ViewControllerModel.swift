//
//  ViewControllerModel.swift
//  Bowties
//
//  Created by Le Van Lam on 4/30/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
import SwiftyJSON

let uiRealm = try! Realm()

class ViewControllerModel {
    
    private var currentBowtie: Bowtie?
    var updateData: ((Void) -> Void)?
    
    private var bowties: Results<Bowtie>!
    init() {
        getData()
    }
    
    private func getData() {
        bowties = uiRealm.objects(Bowtie.self)
        guard bowties.count == 0 else { return }
        //Add data
        guard let path = Bundle.main.path(forResource: "SampleData", ofType: "plist") else { return }
        guard let array = NSArray(contentsOfFile: path) else { return }
        do {
            let data = try JSONSerialization.data(withJSONObject: array, options: [])
            print(data)
        } catch {}
    
//        guard let managedContext = AppDelegate.managedContext else { return }
//        //Retrieve test bowtie
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Bowtie")
//        request.predicate = NSPredicate(format: "searchKey != nil", argumentArray: nil)
//        do {
//            if try managedContext.count(for: request) > 0 {
//                if let bowties = try managedContext.fetch(request) as? [Bowtie] {
//                    self.bowties = bowties
//                }
//                return
//            }
//            guard let path = Bundle.main.path(forResource: "SampleData", ofType: "plist"), let datas = NSArray(contentsOfFile: path) else { return }
//            for data in datas {
//                guard let entity = NSEntityDescription.entity(forEntityName: "Bowtie", in: managedContext) else { return }
//                if let dict = data as? NSDictionary {
//                    let bowtie = Bowtie(entity: entity, insertInto: managedContext, dict: dict)
//                    bowties.append(bowtie)
//                }
//            }
//            try managedContext.save()
//        } catch let error as NSError {
//            print(error.localizedDescription)
//        }
    }
    
    func bowtieForSegment(at title: String) {
//        currentBowtie = bowties.filter({$0.searchKey == title}).first
        updateData?()
    }
    
    func updateBowtie() {
//        guard let managedContext = AppDelegate.managedContext, let currentBowtie = currentBowtie else { return }
//        let times = currentBowtie.timesWorn
//        currentBowtie.timesWorn = times + 1
//        currentBowtie.lastWorn = NSDate()
//        do {
//            try managedContext.save()
//            updateData?()
//        } catch {}
    }
    
    func updateRating(string: String) {
//        guard let managedContext = AppDelegate.managedContext,
//            let currentBowtie = currentBowtie,
//            let rating = Double(string) else { return }
//        currentBowtie.rating = rating
//        do {
//            try managedContext.save()
//            updateData?()
//        } catch {}

    }
//    
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
//
//    var image: UIImage? {
//        guard let photoData = currentBowtie?.photoData as Data? else { return nil }
//        return UIImage(data: photoData)
//    }
//    
//    var name: String {
//        return currentBowtie?.name ?? ""
//    }
//    
//    var ratingLabel: String {
//        guard let rating = currentBowtie?.rating else { return "" }
//        return "Rating: \(Double(rating))/5"
//    }
//    
//    var timesWornLabel: String {
//        guard let currentBowtie = currentBowtie else { return "" }
//        return "# times worn: \(Int(currentBowtie.timesWorn))"
//    }
//    
//    var lastWornLabel: String {
//        guard let lastWorn = currentBowtie?.lastWorn else { return "" }
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .short
//        dateFormatter.timeStyle = .none
//        return "Last worn: " + dateFormatter.string(from: lastWorn as Date)
//    }
    
//    var isHidden: Bool {
//        guard let currentBowtie = currentBowtie else { return false }
//        return !Bool(currentBowtie.isFavorite)
//    }
//    
//    var color: UIColor? {
//        return currentBowtie?.tintColor as? UIColor
//    }
}
