//
//  ViewController.swift
//  projectSunshine
//
//  Created by Iulia Baltoi on 29/04/2017.
//  Copyright © 2017 Iulia Baltoi. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 51.525566, longitude: -0.086766, zoom: 10.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        
        //Styling the map
        /*do {
            // Set the map style by passing the URL of the local file.
            if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }*/

        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 51.525566, longitude: -0.086766)
        marker.title = "London"
        marker.snippet = "United Kingdom"
        marker.map = mapView
        
        
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: 51.520099, longitude: -0.0705446)
        marker2.title = "Starbucks"
        marker2.snippet = "Check in"
        marker2.icon = GMSMarker.markerImage(with: UIColor.green)
        marker2.map = mapView
    }
    
    func mapView(mapView: GMSMapView!, didTapMarker marker: GMSMarker!) -> Bool {
        
        return true
    }
}

