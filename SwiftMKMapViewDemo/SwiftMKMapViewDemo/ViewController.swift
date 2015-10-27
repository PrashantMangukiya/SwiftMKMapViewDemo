//
//  ViewController.swift
//  SwiftMKMapViewDemo
//
//  Created by Prashant on 25/10/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController {

    
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
    
    // outlet - UI map view
    @IBOutlet var myMapView: MKMapView!
    
    
        
    // MARK: - View functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

