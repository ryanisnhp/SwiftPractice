//
//  HomeCell.swift
//  MVVMDemo4
//
//  Created by Le Van Lam on 3/3/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var idLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configCell(homeCellVM: HomeCellVM) {
        self.nameLabel.text = homeCellVM.name
        self.idLabel.text = homeCellVM.id
    }
    
}
