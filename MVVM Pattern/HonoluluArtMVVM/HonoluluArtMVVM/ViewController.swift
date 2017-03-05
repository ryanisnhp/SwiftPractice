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
    private var artWorkViewModel: ArtWorkViewModel! {
        didSet {
            mapView.setRegion(artWorkViewModel.centerMap(), animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupData() {
        artWorkViewModel = ArtWorkViewModel(artworkClosure: { [weak self] (artworks) in
            guard let this = self else { return }
            this.mapView.addAnnotations(artworks)
        })
        artWorkViewModel.initialHonolulu()
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
