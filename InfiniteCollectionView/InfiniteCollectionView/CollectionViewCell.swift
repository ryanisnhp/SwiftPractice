//
//  CollectionViewCell.swift
//  InfiniteCollectionView
//
//  Created by Le Van Lam on 5/22/17.
//  Copyright © 2017 Lam LeVan. All rights reserved.
//

import UIKit
import Haneke

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak fileprivate var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configCell(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        imageView.hnk_setImageFromURL(url)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.hnk_cancelSetImage()
    }

}
