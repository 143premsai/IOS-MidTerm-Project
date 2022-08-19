//
//  MapViewController.swift
//  midterm_PremSaiKrishna_Kandagattla
//
//  Created by user206624 on 7/7/22.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var locationManager = CLLocationManager();

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // When app view appear then we calling the location manager to display the custom map pin
    override func viewDidAppear(_ animated: Bool) {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        map.delegate = self
    }
    
    // sets location and render the custom pin
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            manager.startUpdatingLocation()
            render (location)
        }
    }
    
   // render function sets the region and pin for custom location
    func render (_ location: CLLocation) {
        
        // Getting user current location coordinate
        let coordinate = CLLocationCoordinate2D (latitude: location.coordinate.latitude, longitude: location.coordinate.longitude )
        
        //span into the MAP Zoom based on my Student id 8804341,
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        // Mapping the coordinate and custom span
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        // Creating a pin to display the location
        let pin = MKPointAnnotation ()
        pin.coordinate = coordinate
        pin.title = "Here I am"
        
        map.addAnnotation(pin)
        map.setRegion(region, animated: true)
        
    }
    

    
    

}
