//
//  MapViewController.swift
//  WeatherApp
//
//  Created by Petar Santor on 10/29/18.
//  Copyright © 2018 Apptisan. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            print("Tapped at lat: \(locationCoordinate.latitude) long: \(locationCoordinate.longitude)")
        }
    }
    
}

extension MapViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
