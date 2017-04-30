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
    var lat: CLLocationDegrees
    let long: CLLocationDegrees
    let type: Type
}

class MapViewController: UIViewController, GMSMapViewDelegate, SummaryViewProtocol {

    var mapView: GMSMapView?
    var summaryView = SummaryView(frame: CGRect(x:7, y:520, width:360, height:90))
    var markerView = MarkerView(frame: CGRect(x:10, y:550, width:200, height:123))

    var tapped = false
    
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
        
        summaryView.delegate = self
        
        let camera = GMSCameraPosition.camera(withLatitude: 51.525566, longitude: -0.086766, zoom: 5.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView?.delegate = self

        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 51.525566, longitude: -0.086766)
        marker.title = "London"
        marker.icon = UIImage(named: "man")
        marker.snippet = "United Kingdom"
        marker.map = mapView
        
        let button:UIButton = UIButton(frame: CGRect(x: 300 , y: 20, width: 50, height: 50))
        button.setImage(UIImage(named: "energy-icon"), for: .normal)
        button.setTitle("", for: .normal)
        button.addTarget(self, action:#selector(self.changeMap(_:)), for: .touchUpInside)
        self.view.addSubview(button)
        
        for business in businesses {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: business.lat, longitude: business.long)
            marker.title = business.name
            marker.snippet = "Check in"
            marker.icon = (business.type == .Green) ? UIImage(named: "pin-green") : UIImage(named: "pin-red")
            marker.map = mapView
            marker.tracksInfoWindowChanges = true
            marker.userData = business.type
        }
        
        
        self.delay(seconds: 0.5) {
            self.mapView?.animate(toZoom: 12.0)
        }
    }
    
    func delay(seconds: Double, completion:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            completion()
        }
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        self.markerView.name.text = marker.title
        return self.markerView
    }
 
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        self.summaryView .removeFromSuperview()
        
        return false
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {

        tapped = true
        
        if tapped {
            
            summaryView.configureForType(type: (marker.userData as? Type)!)
            if let type = marker.userData as? Type {
                
                let typeDict:[String: Type] = ["type": type]

                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "level"), object: nil, userInfo: typeDict)

            }
            self.view.addSubview(summaryView)
        } else {
            summaryView.removeFromSuperview()
        }
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
    
    func didTapCloseButton() {
        self.summaryView.removeFromSuperview()
    }
    
    func didTapDetails() {
        let locationVC = LocationEnergyDetailViewController()
        present(locationVC, animated: true)
      
    }
}

