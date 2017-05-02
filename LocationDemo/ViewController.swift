//
//  ViewController.swift
//  LocationDemo
//
//  Created by Asif Ikbal on 4/30/17.
//  Copyright © 2017 Asif Ikbal. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate{
    
    @IBOutlet weak var mapOutlet: MKMapView!

    
//    @IBOutlet weak var latitudeLongitude: UILabel!
//    @IBOutlet weak var longitudeLabel: UILabel!
    
    var manager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set the delegate for the location manager
        manager.delegate  = self
        // ask authorization from user
        manager.requestWhenInUseAuthorization()
        //start the location update
        manager.startUpdatingLocation()
        
//         Only once u want to use permission
//        manager.requestLocation()
    }

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations)
        let location = locations[0]
        
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let position = location.coordinate
        let region = MKCoordinateRegion(center: position, span: span)
        
        mapOutlet.setRegion(region, animated: true)
        mapOutlet.showsUserLocation = true
        
        // show location data on label
//        latitudeLongitude.text =  String(location.coordinate.latitude)
//        longitudeLabel.text = String(location.coordinate.longitude)
        print(location)
        
    }
    


}

