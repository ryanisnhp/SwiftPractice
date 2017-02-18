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
}
