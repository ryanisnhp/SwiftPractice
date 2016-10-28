//
//  Burger.swift
//  BuilderPattern
//
//  Created by Le Van Lam on 7/27/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation

class Burger {
    let customerName: String
    let veggieProduct: Bool //rau
    let patties: Int //cha?
    let pickles: Bool //dua muoi
    let mayo: Bool// sot mayo
    let ketchup: Bool //sot a chua
    let lettuce: Bool//xa lach, rau diep
    let cook: Cooked
    let bacon: Bool
    
    enum Cooked: String {
        case RARE = "Rare"
        case NORMAL = "Normal"
        case WELLDONE = "Well Done"
    }
    
    init(name: String, veggie: Bool, patties: Int, pickles: Bool, mayo: Bool, ketchup: Bool, lettuce: Bool, cook: Cooked, bacon: Bool) {
        self.customerName = name
        self.veggieProduct = veggie
        self.patties = patties
        self.pickles = pickles
        self.mayo = mayo
        self.ketchup = ketchup
        self.lettuce = lettuce
        self.cook = cook
        self.bacon = bacon
    }
    
    func printDescription() {
        print("Name \(self.customerName)")
        print("Veggie: \(self.veggieProduct)")
        print("Patties: \(self.patties)")
        print("Pickles: \(self.pickles)")
        print("Mayo: \(self.mayo)")
        print("Ketchup: \(self.ketchup)")
        print("Lettuce: \(self.lettuce)")
        print("Cook: \(self.cook.rawValue)")
        print("Bacon: \(self.bacon)")
    }

}