//
//  HomeViewCell.swift
//  AlamofireWithXML
//
//  Created by Le Van Lam on 2/25/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class HomeViewCell: UITableViewCell {
    
    @IBOutlet private weak var imgView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var pubDateLabel: UILabel!
    @IBOutlet private var imageConstraints: [NSLayoutConstraint]!
    static let height: CGFloat = 292
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        for constraint in imageConstraints {
//            constraint.constant *= Ratio.horizontal
//        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configCell(vnexpress: Vnexpress) {
        titleLabel.text = vnexpress.title
        pubDateLabel.text = vnexpress.pubDate
        if vnexpress.imageURLString.characters.count > 0 {
            Alamofire.request(vnexpress.imageURLString).responseImage { response in
                if let image = response.result.value {
                    self.imgView.image = image
                }
            }
        }
    }
    
}
