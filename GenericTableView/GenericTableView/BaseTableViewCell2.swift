//
//  BaseTableViewCell2.swift
//  GenericTableView
//
//  Created by LeVanLam on 2/18/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit

class BaseTableViewCell2: UITableViewCell, Reusable {
    
    @IBOutlet private weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(name: String) {
        label.text = name
    }
    
}
