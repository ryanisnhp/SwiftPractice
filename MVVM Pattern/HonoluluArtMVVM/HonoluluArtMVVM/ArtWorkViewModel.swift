//
//  ArtWorkViewModel.swift
//  HonoluluArtMVVM
//
//  Created by Le Van Lam on 3/5/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit
import MapKit

class ArtWorkViewModel {
    
    var artworks: [Artwork] = []
    typealias ArtWorkClosure = ([Artwork]) -> Void
    private var artworkClosure: ArtWorkClosure
    
    init(artworkClosure: @escaping ArtWorkClosure) {
        self.artworkClosure = artworkClosure
    }
    
    
    func centerMap() -> MKCoordinateRegion {
        return Location(lat: 21.283921, lng: -157.831661).centerMapOnLocation
    }
    
    func initialHonolulu() {
        let artNetwork = ArtWorkNetwork()
        artNetwork.sendData = { [weak self] artworks, error in
            guard let this = self, let artworks = artworks else { return }
            this.artworks = artworks.artWorks
            this.artworkClosure(this.artworks)
        }
        artNetwork.execute()
    }
    
}
