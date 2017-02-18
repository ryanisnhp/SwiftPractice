//
//  CollectionViewExtensions.swift
//  GenericTableView
//
//  Created by LeVanLam on 2/18/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func registerCell<T: UICollectionViewCell>(_: T.Type) where T: Reusable {
        if T.isNibExisted {
            register(T.nib, forCellWithReuseIdentifier: T.identifier)
        } else {
            register(T.self, forCellWithReuseIdentifier: T.identifier)
        }
    }
    
    func registerSupplementary<T: UICollectionViewCell>(elementKind: String, _: T.Type) where T: Reusable {
        if T.isNibExisted {
            register(T.nib, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.identifier)
        } else {
            register(T.self, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.identifier)
        }
    }
    
    func dequeue<T: UICollectionViewCell>(_: T.Type, indexPath: IndexPath) -> T? where T: Reusable {
        return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T
    }
    
    func dequeueSupplementaryView<T: UICollectionViewCell>(elementKind: String, indexPath: IndexPath) -> T? where T: Reusable {
        return dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: T.identifier, for: indexPath) as? T
    }
}
