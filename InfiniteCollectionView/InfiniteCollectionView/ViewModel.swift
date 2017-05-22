//
//  ViewModel.swift
//  InfiniteCollectionView
//
//  Created by Le Van Lam on 5/22/17.
//  Copyright © 2017 Lam LeVan. All rights reserved.
//

import Foundation

struct ViewModel {
    
    private var imageStruct: Images
    
    init(images: Images) {
        imageStruct = images
    }
    
    var images: [String] {
        var newImage: [String] = imageStruct.urlStrings
        newImage += newImage
        newImage += newImage
        return newImage
    }
}
