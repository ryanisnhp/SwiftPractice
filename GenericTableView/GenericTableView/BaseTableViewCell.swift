//
//  BaseTableViewCell.swift
//  GenericTableView
//
//  Created by LeVanLam on 2/18/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell, Reusable {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib? {
        if BaseTableViewCell.isNibExisted {
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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
