//
//  ViewController.swift
//  projectSunshine
//
//  Created by Iulia Baltoi on 29/04/2017.
//  Copyright © 2017 Iulia Baltoi. All rights reserved.
//

import UIKit
import GoogleMaps

enum Type {
    case Green
    case Red
}

struct Business {
    let name: String
    let lat: CLLocationDegrees
    let long: CLLocationDegrees
    let type: Type
}

class MapViewController: UIViewController {

    var mapView: GMSMapView?
    
    @IBOutlet weak var mapButton: UIButton!
    
    let businesses = [
        Business(name: "Starbucks", lat: 50.520099, long: -0.0705446, type: .Green),
        Business(name: "Apple", lat: 51.510099, long: -0.0605446, type: .Green),
        Business(name: "Wallmart", lat: 51.490099, long: -0.0505446, type: .Red),
        Business(name: "Whole Foods", lat: 51.490099, long: -0.0605446, type: .Green),
        Business(name: "Planet Organic", lat: 51.530099, long: -0.0705446, type: .Red),
        Business(name: "Pret a manger", lat: 51.540099, long: -0.0905446, type: .Green),
        Business(name: "Costa", lat: 51.5140099, long: -0.1005446, type: .Red),
        Business(name: "Eat", lat: 51.510099, long: -0.0455446, type: .Green),
        Business(name: "Pizza Hut", lat: 51.500099, long: -0.0655446, type: .Green),
        Business(name: "Wahaca", lat: 51.520099, long: -0.0715446, type: .Green),
        Business(name: "Honest Burgers", lat: 51.530099, long: -0.0915446, type: .Red),
        Business(name: "Byron", lat: 51.540099, long: -0.0345446, type: .Red),
        Business(name: "Zara", lat: 51.550099, long: -0.0555446, type: .Red),
        Business(name: "Topshop", lat: 51.513099, long: -0.0235446, type: .Red),
        Business(name: "Tesco", lat: 51.5320099, long: -0.0345446, type: .Red),
        Business(name: "Waitrose", lat: 51.550099, long: -0.0315446, type: .Red),
        Business(name: "Sainsburys", lat: 51.550099, long: -0.0315446, type: .Red),
        Business(name: "Waterstones", lat: 51.5200099, long: -0.1205446, type: .Green),
        Business(name: "Debenhams", lat: 51.5340099, long: -0.11505446, type: .Green),
        Business(name: "Marks & Spencer", lat: 52.5340099, long: -0.1255446, type: .Red),
        Business(name: "Argos", lat: 51.5340099, long: -0.1305446, type: .Green),
        Business(name: "HSBC", lat: 51.5040099, long: -0.1315446, type: .Green),
        Business(name: "Barclays", lat: 51.5240099, long: -0.1115446, type: .Red),
        Business(name: "Boots", lat: 51.5240099, long: -0.1165446, type: .Red),

    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for business in businesses {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: business.lat, longitude: business.long)
            marker.title = business.name
            marker.snippet = "Details"
            marker.icon = (business.type == .Green) ? UIImage(named: "pin-green") : UIImage(named: "pin-red")
            marker.map = mapView
        }
    }
    
    override func loadView() {

        let camera = GMSCameraPosition.camera(withLatitude: 51.525566, longitude: -0.086766, zoom: 12.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)

        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 51.525566, longitude: -0.086766)
        marker.title = "London"
        marker.icon = UIImage(named: "man")
        marker.snippet = "United Kingdom"
        marker.map = mapView
        
        
        let button:UIButton = UIButton(frame: CGRect(x: 355 , y: 630, width: 50, height: 50))
        button.backgroundColor = .green
        button.setTitle("", for: .normal)
        button.addTarget(self, action:#selector(self.changeMap(_:)), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    func mapView(mapView: GMSMapView!, didTapMarker marker: GMSMarker!) -> Bool {
        
        //show banner 
        
        return true
    }
    
    @IBAction func changeMap(_ sender: UIButton) {

        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            //Styling the map
            do {
                if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                    mapView?.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
                } else {
                    NSLog("Unable to find style.json")
                }
            } catch {
                NSLog("One or more of the map styles failed to load. \(error)")
            }
        } else {
            mapView?.mapStyle = nil
        }
    }
}

