//
//  HomeVM.swift
//  MVVMDemo4
//
//  Created by Le Van Lam on 3/3/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit

class HomeVM {
    
    fileprivate var venues: [Venue] = []
    var oldOffset: Int = 0
    fileprivate var offset: Int = 0
    fileprivate let limit: Int = 10

    func execute(completion: @escaping () -> ()) {
        APIService.request(method: .get, url: Strings.url, params: nil) { (data, success, message) in
            self.venues = Venue.venues(withData: data)!
            DispatchQueue.main.async {
                completion()
            }
        }

    }
}

extension HomeVM {
    
    var count: Int {
        return venues.count
    }
    
    func cellModel(atIndex index: Int) -> HomeCellVM {
        return HomeCellVM(venue: venues[index])
    }
}
