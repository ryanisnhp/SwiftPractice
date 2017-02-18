//
//  Reusable.swift
//  GenericTableView
//
//  Created by LeVanLam on 2/18/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit

protocol Reusable {
    static var identifier: String {get}
    static var nib: UINib? {get}
    static var isNibExisted: Bool {get}
}

extension Reusable {
    
    static var identifier: String {
        return String(describing: self)
    }
    static var nib: UINib? {
        if Self.isNibExisted {
            return UINib(nibName: String(describing: self), bundle: nil)
        }
        return nil
    }
    static var isNibExisted: Bool {
        if Bundle.main.path(forResource: String(describing: self), ofType: "nib") == nil {
            return false
        }
        return true
    }
}
