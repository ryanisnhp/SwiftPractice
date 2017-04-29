//
//  ViewController.swift
//  RealmStarted
//
//  Created by Lam Le Van on 8/24/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit
import RealmSwift
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet fileprivate weak var tableView: UITableView!
    @IBOutlet fileprivate weak var mapView: MKMapView!
    var locationManager: CLLocationManager?
    var lastLocation: CLLocation?
    let distanceSpan: Double = 500
    var venues: [Venue]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.onVenuesUpdated(_:)), name: NSNotification.Name(rawValue: API.notifications.venuesUpdated), object: nil)
    }
    
    func refreshVenues(_ location: CLLocation?, getDataFromFoursquare: Bool = false) {
        //if location is not nil, set it as the last location
        if location != nil {
            lastLocation = location
            
        }
        
        //If the last location is not nil, if a last location was set OR parameter locationi was not nil
        if let location = lastLocation {
            if getDataFromFoursquare  {
                CoffeeAPI.sharedInstance.getCoffeeShopWithLocation(location)
            }
            
            let (start, stop) = calculateCoordinateWithRegion(location)
            
            //Set up a predicate that ensures the fetches venues are within the region
            let predicate = NSPredicate(format: "latitude < %f AND latitude > %f longitude > %f AND longitude < %f", start.latitude, stop.longitude, stop.longitude, stop.longitude)
            
            //intial the Realm
            let realm = try! Realm()
            venues = realm.objects(Venue).filter(predicate).sort {
                location.distanceFromLocation($0.coordinate) < location.distanceFromLocation($1.coordinate);
            }
            
            for venue in venues! {
                let annotation = CoffeeAnnotation(title: venue.name, subTitle: venue.address, coordinate: CLLocationCoordinate2D(latitude: Double(venue.latitude), longitude: Double(venue.longitude)))
                mapView.addAnnotation(annotation)
            }
            
            //Reload all the datas
            tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if locationManager == nil {
            locationManager = CLLocationManager()
            locationManager?.delegate = self
            locationManager?.desiredAccuracy = kCLLocationAccuracyBestForNavigation
            locationManager?.requestAlwaysAuthorization()
            locationManager?.distanceFilter = 50
            locationManager?.startUpdatingLocation()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateCoordinateWithRegion(_ location: CLLocation) -> (CLLocationCoordinate2D, CLLocationCoordinate2D) {
        let region = MKCoordinateRegionMakeWithDistance(location.coordinate, distanceSpan, distanceSpan)
        var start = CLLocationCoordinate2D()
        var stop = CLLocationCoordinate2D()
        start.latitude = region.center.latitude + (region.span.latitudeDelta / 2.0)
        start.longitude = region.center.longitude - (region.span.longitudeDelta / 2.0)
        stop.latitude = region.center.latitude - (region.span.latitudeDelta / 2.0)
        stop.longitude = region.center.longitude - (region.span.longitudeDelta / 2.0)
        
        return (start, stop)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        let region = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, distanceSpan, distanceSpan)
        mapView.setRegion(region, animated: true)
    }
    
    func onVenuesUpdated(_ notification: Notification) {
        refreshVenues(nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // When venues is nil, this will return 0 (nil-coalescing operator ??)
        return venues?.count ?? 0
    }
    
    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier") {
            if let venue = venues?[indexPath.row] {
                cell.textLabel?.text = venue.name
                cell.detailTextLabel?.text = venue.address
            }
            return cell
        }
        
        return UITableViewCell()
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        var view = mapView.dequeueReusableAnnotationView(withIdentifier: "annontationIdentifier")
        if view == nil {
            view =
        }
    }
}
