//
//  MapViewController.swift
//  WeatherApp
//
//  Created by Petar Santor on 10/29/18.
//  Copyright © 2018 Apptisan. All rights reserved.
//

import UIKit
import MapKit
import RxSwift

class MapViewController: UIViewController {
    
    // MARK: - Properties
    
    var coordinator: MapCoordinator!
    var currentLocation: Variable<CLLocation>?
    
    //MARK: - Outlets
    
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addGestureRecognizerToMap()
        mapView.showsUserLocation = true
        LocationManager.shared.delegate = self
        LocationManager.shared.checkLocationAuthorizationStatus()
    }
    
    // MARK: Utilities
    
    func addGestureRecognizerToMap() {
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(doubleTapped(_:)))
        tap.numberOfTapsRequired = 2
        tap.delegate = self
        mapView.addGestureRecognizer(tap)
    }
    
    @objc func doubleTapped(_ gestureRecognizer: UIGestureRecognizer?) {
        if let touchLocation = gestureRecognizer?.location(in: mapView) {
            let locationCoordinate = mapView.convert(touchLocation,
                                                     toCoordinateFrom: mapView)
            coordinator.goToWeatherDetails(forLocation: locationCoordinate)
        }
    }
    
}

// MARK: UIGestureRecognizerDelegate

extension MapViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

// MARK: LocationManagerDelegate

extension MapViewController: LocationManagerDelegate {
    func locationUpdated(_ newRegion: MKCoordinateRegion) {
        self.mapView.setRegion(newRegion, animated: true)
    }
    
    func locationUpdateError(_ error: LocationError) {
        print("error")
    }
}
