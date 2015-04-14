//
//  ViewController.swift
//  Maps
//
//  Created by Chad Duffey on 12/04/2015.
//  Copyright (c) 2015 Chad Duffey. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //cowra = 33.834968, 148.693319
        
        
        //set up our location tracker
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        
        
        var lattitude:CLLocationDegrees = -33.834968
        var longtitude: CLLocationDegrees = 148.693319
        
        //difference between one side of screen and other
        //gives us zoom level
        var latDelta:CLLocationDegrees = 0.01
        var lonDelta:CLLocationDegrees = 0.01
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        var location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lattitude, longtitude)
        
        
        var region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        
        annotation.title = "Home Town!"
        
        annotation.subtitle = "Visiting in April"
        
        map.addAnnotation(annotation)
        
        
        
        //set up the long press recogniser
        
        var uiLpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        
        uiLpgr.minimumPressDuration = 2
        
        map.addGestureRecognizer(uiLpgr)
        
        
    }
    
    //funciton to handle our gestures
    func action(gestureRecognizer:UIGestureRecognizer) {
    
        //this is relative to the map
        var touchPoint = gestureRecognizer.locationInView(self.map)
        
        //we need to get it converted to a coordinate
        var mapCoordinate: CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = mapCoordinate
        
        annotation.title = "Home Town!"
        
        annotation.subtitle = "Visiting in April"
        
        map.addAnnotation(annotation)
        
        
    }
        
        
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        println(locations)
    
        var userLocation: CLLocation = locations[0] as CLLocation
        
        var latitude = userLocation.coordinate.latitude
        var longitude = userLocation.coordinate.longitude
        
        var latDelta:CLLocationDegrees = 0.01
        var lonDelta:CLLocationDegrees = 0.01
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        var location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        self.map.setRegion(region, animated: false)
        
        
    }
        
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

