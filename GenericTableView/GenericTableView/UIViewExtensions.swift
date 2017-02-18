//
//  UIViewExtensions.swift
//  GenericTableView
//
//  Created by LeVanLam on 2/18/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit

extension Bundle {
    
    class func loadView<T: UIView>(_: T.Type) -> T? where T: Reusable {
        return main.loadNibNamed(T.identifier, owner: self, options: nil)?.first as? T
    }
}
