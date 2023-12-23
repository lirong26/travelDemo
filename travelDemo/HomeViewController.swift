//
//  HomeViewController.swift
//  travelDemo
//
//  Created by Ruyi Li on 2023/12/22.
//

import Foundation
import UIKit
import GoogleMaps

class HomeViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapContainerView: UIView!
    var locationManager: CLLocationManager?
    var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let options = GMSMapViewOptions()
        options.frame = mapContainerView.bounds
        mapView = GMSMapView(options: options)
        mapContainerView.addSubview(mapView)
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let latitude = location?.coordinate.latitude ?? -33.86
        let longitude = location?.coordinate.longitude ?? 151.20
        mapView.camera = GMSCameraPosition(latitude: latitude, longitude: longitude, zoom: 20)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        locationManager?.stopUpdatingLocation()
    }
}
