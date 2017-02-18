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
        return nil
        return UINib(nibName: BaseTableViewCell.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
