//
//  HomeCellVM.swift
//  MVVMDemo4
//
//  Created by Le Van Lam on 3/3/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import Foundation

class HomeCellVM {
    
    private(set) var name: String
    private(set) var id: String
    
    init(name: String, id: String) {
        self.name = name
        self.id = id
    }
    
    init(venue: Venue) {
        self.name = venue.name
        self.id = venue.id
    }
}
