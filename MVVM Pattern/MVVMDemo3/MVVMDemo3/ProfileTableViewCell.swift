//
//  ProfileTableViewCell.swift
//  MVVMDemo3
//
//  Created by LeVanLam on 2/18/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configCell(profileViewModel: ProfileViewModel) {
        timeLabel?.text = profileViewModel.timeForProfile()
    }
    
}
