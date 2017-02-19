//
//  ViewController.swift
//  GMapsDemo
//
//  Created by Gabriel Theodoropoulos on 29/3/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit
import GoogleMaps


class ViewController: UIViewController {

    @IBOutlet weak var viewMap: GMSMapView!
    
    @IBOutlet weak var bbFindAddress: UIBarButtonItem!
    
    @IBOutlet weak var lblInfo: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    override func loadView() {
        //Create a GMSCameraPosition that tells map to display coordinate at x zoom level 
        let camera = GMSCameraPosition.camera(withLatitude: 40.6602, longitude: -73.9690, zoom: 13.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        //Creates a marker in the center of the map
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 40.6602, longitude: -73.9690)
        marker.title = "Park Slope"
        marker.snippet = "Brooklyn "
        marker.map = mapView
        
    
    }
    
    
    
    // MARK: IBAction method implementation
    
    @IBAction func changeMapType(_ sender: AnyObject) {
        
    }
    
    
    @IBAction func findAddress(_ sender: AnyObject) {
    
    }
    
    
    @IBAction func createRoute(_ sender: AnyObject) {
    
    }
    
    
    @IBAction func changeTravelMode(_ sender: AnyObject) {
    
    }
    
    
}

