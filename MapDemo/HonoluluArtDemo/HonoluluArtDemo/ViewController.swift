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
        artNetwork.sendData = { [weak self] artworks, error in
            guard let this = self else {
                return
            }
            guard let artworks = artworks else {
                return
            }
            this.mapView.addAnnotations(artworks.artWorks)
        }
        artNetwork.execute()
    }
}

extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? Artwork else {
            return MKAnnotationView()
        }
        var view: MKPinAnnotationView
        if let dequeueView = mapView.dequeueReusableAnnotationView(withIdentifier: annotation.discipline) as? MKPinAnnotationView {
            dequeueView.annotation = annotation
            view = dequeueView
        } else {
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotation.discipline)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: UIButtonType.detailDisclosure)
        }
        view.pinTintColor = annotation.pinColor
        return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as? Artwork
        let lauchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location?.mapItem().openInMaps(launchOptions: lauchOptions)
    }
}
