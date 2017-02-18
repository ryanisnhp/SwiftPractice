//
//  TableViewExtensions.swift
//  GenericTableView
//
//  Created by LeVanLam on 2/18/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerCell<T: UITableViewCell>(_: T.Type) where T: Reusable {
        if let nib = T.nib {
            register(nib, forCellReuseIdentifier: T.identifier)
        } else {
            register(T.self, forCellReuseIdentifier: T.identifier)
        }
    }
    
    func dequeue<T: UITableViewCell>(_: T.Type) -> T? where T: Reusable {
        return dequeueReusableCell(withIdentifier: T.identifier) as? T
    }
    
    func dequeue<T: UITableViewCell>(_: T.Type, indexPath: IndexPath) -> T? where T: Reusable {
        return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T
    }
    
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(_: T.Type) where T: Reusable {
        if let nib = T.nib {
            register(nib, forHeaderFooterViewReuseIdentifier: T.identifier)
        } else {
            register(T.self, forHeaderFooterViewReuseIdentifier: T.identifier)
        }
    }
    
    func dequeueHeaderFooter<T: UITableViewHeaderFooterView>(_: T.Type) -> T? where T: Reusable {
        return dequeueReusableHeaderFooterView(withIdentifier: T.identifier) as? T
    }
    
}
