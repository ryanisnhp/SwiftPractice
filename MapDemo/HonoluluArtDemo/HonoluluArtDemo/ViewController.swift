//
//  ViewController.swift
//  HonoluluArtDemo
//
//  Created by LeVanLam on 2/18/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet private weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialHonolulu()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func initialHonolulu() {
        
        let location = Location(lat: 21.283921, lng: -157.831661)
        mapView.setRegion(location.centerMapOnLocation, animated: true)

        let artNetwork = ArtWorkNetwork()
        artNetwork.sendData = { [weak self] artworks in
            guard let this = self else {
                return
            }
            this.mapView.addAnnotations(artworks.artWorks)
        }
        artNetwork.execute()
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "pin"
        var view: MKPinAnnotationView
        if let dequeueView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
            dequeueView.annotation = annotation
            view = dequeueView
        } else {
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: UIButtonType.detailDisclosure)
        }
        return view
    }
}
