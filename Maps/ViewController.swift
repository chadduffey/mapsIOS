//
//  ViewController.swift
//  Maps
//
//  Created by Chad Duffey on 12/04/2015.
//  Copyright (c) 2015 Chad Duffey. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //cowra = 33.834968, 148.693319
        
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
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

