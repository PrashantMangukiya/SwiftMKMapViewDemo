//
//  ViewController.swift
//  SwiftMKMapViewDemo
//
//  Created by Prashant on 25/10/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    
    // location manager object
    let locationManager = CLLocationManager()
    
    
    // outlet and action - map type segment control
    @IBOutlet var mapType: UISegmentedControl!
    @IBAction func mapTypeValueChanged(sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            self.mapType.tintColor = UIColor.blackColor()
            self.myMapView.mapType = MKMapType.Standard
        }

        if sender.selectedSegmentIndex == 1 {
            self.mapType.tintColor = UIColor.whiteColor()
            self.myMapView.mapType = MKMapType.Satellite
        }
        
        if sender.selectedSegmentIndex == 2 {
            self.mapType.tintColor = UIColor.whiteColor()
            self.myMapView.mapType = MKMapType.Hybrid
        }
    }
    
    
    // outlet - map view
    @IBOutlet var myMapView: MKMapView!
    
    // action - user location button
    @IBAction func userLocationButtonAction(sender: UIBarButtonItem) {
        
        // show user location on map (it will show blue dot at user location)
        self.myMapView.showsUserLocation = true
        
        // start updating location, so it will refresh map region with recent location.
        self.locationManager.startUpdatingLocation()
    }
    
    // action - zoom in button
    @IBOutlet var zoomInButton: UIBarButtonItem!
    @IBAction func zoomInButtonAction(sender: UIBarButtonItem) {
        
        // create span
        let deltaX = self.myMapView.region.span.latitudeDelta - 0.001
        let deltaY = self.myMapView.region.span.longitudeDelta - 0.001
        let newSpan = MKCoordinateSpanMake(deltaX, deltaY)
        
        // find user location
        let userLocation = self.myMapView.userLocation
        
        // create new region
        let newRegion = MKCoordinateRegion(center: userLocation.coordinate, span: newSpan)
        
        // set segion within map
        self.myMapView.setRegion(newRegion, animated: true)
        
        // if enough zoon in then disable zoom in button
        if deltaX < 0.001 {
            self.zoomInButton.enabled = false
        }        
    }
    
    // action - zoom out button
    @IBOutlet var zoomOutButton: UIBarButtonItem!
    @IBAction func zoomOutButtonAction(sender: UIBarButtonItem) {
        
        // create span
        let deltaX = self.myMapView.region.span.latitudeDelta + 0.001
        let deltaY = self.myMapView.region.span.longitudeDelta + 0.001
        let newSpan = MKCoordinateSpanMake(deltaX, deltaY)
        
        // find user location
        let userLocation = self.myMapView.userLocation
        
        // create new region
        let newRegion = MKCoordinateRegion(center: userLocation.coordinate, span: newSpan)
        
        // set segion within map
        self.myMapView.setRegion(newRegion, animated: true)
        
        // enable zoon in button when delta increase enough
        if deltaX > 0.002 {
           self.zoomInButton.enabled = true
        }
    }
    
    
    
    // MARK: - View functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        // set location manager delegate
        self.locationManager.delegate = self
        
        // set map view delegate
        self.myMapView.delegate = self
        
        // set location accuracy
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // request location access permision from user.
        self.locationManager.requestWhenInUseAuthorization()
        
        // start updating location, so it will set map region initially
        self.locationManager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    // MARK: - location manager delegate
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        
        // create span
        let deltaX = 0.01
        let deltaY = 0.01
        let newSpan = MKCoordinateSpanMake(deltaX, deltaY)
        
        // create new region
        let newRegion = MKCoordinateRegion(center: newLocation.coordinate, span: newSpan)
        
        // set new region for map
        self.myMapView.setRegion(newRegion, animated: true)

        // stop updating location 
        // we have to update region once so no need to keep updating location
        self.locationManager.stopUpdatingLocation()
        
        // enable zoom in button if disabled.
        self.zoomInButton.enabled = true
    }
    

}

