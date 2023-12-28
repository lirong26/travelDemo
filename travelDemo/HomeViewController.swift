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
    var mapView: GMSMapView!
    
    @IBOutlet weak var personMarker: UIImageView!
    @IBOutlet weak var stationMarker: UIImageView!
    @IBOutlet weak var hotelMarker: UIImageView!
    @IBOutlet weak var castleMarker: UIImageView!
    @IBOutlet weak var restaurantMarker: UIImageView!
    @IBOutlet weak var mallMarker: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let options = GMSMapViewOptions()
        options.frame = mapContainerView.bounds
        mapView = GMSMapView(options: options)
        mapContainerView.addSubview(mapView)
        mapContainerView.sendSubviewToBack(mapView)
        
        let castleLocation = CLLocationCoordinate2D(latitude: 34.6871414, longitude: 135.5239327)
        mapView.camera = GMSCameraPosition(target: castleLocation, zoom: 14)
        
        let castlePoint = castleMarker.center
        let centerPoint = mapView.center
        let scrollX = centerPoint.x - castlePoint.x
        let scrollY = centerPoint.y - castlePoint.y
        
        let newCenterPoint = CGPoint(x: centerPoint.x+scrollX, y: centerPoint.y+scrollY)
        let centerLocation = mapView.projection.coordinate(for: newCenterPoint)
        mapView.camera =  GMSCameraPosition(target: centerLocation, zoom: 14)
        
        let personLocation = mapView.projection.coordinate(for: personMarker.center)
        let stationLocation = mapView.projection.coordinate(for: stationMarker.center)
        let hotelLocation = mapView.projection.coordinate(for: hotelMarker.center)
        let restaurantLocation = mapView.projection.coordinate(for: restaurantMarker.center)
        let mallLocation = mapView.projection.coordinate(for: mallMarker.center)

        let path = GMSMutablePath()
        path.add(personLocation)
        path.add(stationLocation)
        path.add(hotelLocation)
        path.add(castleLocation)
        path.add(restaurantLocation)
        path.add(mallLocation)
        
        let polyline = GMSPolyline(path: path)
        polyline.strokeWidth = 16
        polyline.geodesic = true
        let image = UIImage(named: "credit0")!
        let stampStyle = GMSSpriteStyle(image: image)
        let transparentStampStroke = GMSStrokeStyle.transparentStroke(withStamp: stampStyle)
        let span = GMSStyleSpan(style: transparentStampStroke)
        polyline.spans = [span]
        polyline.map = mapView
        
    }

}
