//
//  ViewController.swift
//  GMapsDemo
//
//  Created by Gabriel Theodoropoulos on 29/3/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit
import GoogleMaps


class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var viewMap: GMSMapView!
    
    @IBOutlet weak var bbFindAddress: UIBarButtonItem!
    
    @IBOutlet weak var lblInfo: UILabel!
    
    var locationMarker: GMSMarker!
    var locationManager = CLLocationManager()
    var didFindMyLocaton = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Position Camera over Prospect Park at Zoom level 8
        let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: 40.6602, longitude: -73.9690, zoom: 12.0)
        viewMap.camera = camera
        
        //Request when in use authorization for location services
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
       
//  The current location of the user is described by a property of the map view object named myLocation. this property is a KVO-compliant (key-value observing compliant), meaning that we have to observe for changes on its value in order to know when the user’s location gets updated.
        viewMap.addObserver(self, forKeyPath: "myLocation", options: NSKeyValueObservingOptions.new, context: nil)
        

    }


    
    //MARK: LocationManager Delegate Methods
    private func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.authorizedWhenInUse {
            viewMap.isMyLocationEnabled = true
        }
    }


    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if !didFindMyLocaton {
            let myLocation: CLLocation = change![NSKeyValueChangeKey.newKey] as! CLLocation
            viewMap.camera = GMSCameraPosition.camera(withTarget: myLocation.coordinate, zoom: 10.0)
            viewMap.settings.myLocationButton = true
            didFindMyLocaton = true
            
        }
      
        
    }
    
    func setupLocationMarker(coordinate: CLLocationCoordinate2D) {
        locationMarker = GMSMarker(position: coordinate)
        locationMarker.map = viewMap
    }
    
    
    
    
    
    // MARK: IBAction method implementation
    
    @IBAction func changeMapType(_ sender: AnyObject) {
        
        let actionSheet = UIAlertController(title: "Map Type", message: "Select Map Types", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let normalMapTypeAction = UIAlertAction(title: "Normal", style: UIAlertActionStyle.default) { (alertAction) in
            self.viewMap.mapType = kGMSTypeNormal
        }
        
        let terrainMapTypeAction = UIAlertAction(title: "Terrain", style: UIAlertActionStyle.default) { (alertAction) in
            self.viewMap.mapType = kGMSTypeTerrain
        }
        
        let hybridMapTypeAction = UIAlertAction(title: "Hybrid", style: UIAlertActionStyle.default) { (alertAction) in
            self.viewMap.mapType = kGMSTypeHybrid
        }
        
        let cancelAction = UIAlertAction(title: "Close", style: UIAlertActionStyle.cancel) { (alertAction) -> Void in
            
        }
        actionSheet.addAction(normalMapTypeAction)
        actionSheet.addAction(terrainMapTypeAction)
        actionSheet.addAction(hybridMapTypeAction)
        actionSheet.addAction(cancelAction)
        
         self.present(actionSheet, animated: true, completion: nil)
        
        
        
    }
    
    
    @IBAction func findAddress(_ sender: AnyObject) {
    
    }
    
    
    @IBAction func createRoute(_ sender: AnyObject) {
    
    }
    
    
    @IBAction func changeTravelMode(_ sender: AnyObject) {
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //    override func loadView() {
    //        //Create a GMSCameraPosition that tells map to display coordinate at x zoom level
    //        let camera = GMSCameraPosition.camera(withLatitude: 40.6602, longitude: -73.9690, zoom: 13.0)
    //        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
    //        view = mapView
    //
    //        //Creates a marker in the center of the map
    //        let marker = GMSMarker()
    //        marker.position = CLLocationCoordinate2D(latitude: 40.6602, longitude: -73.9690)
    //        marker.title = "Park Slope"
    //        marker.snippet = "Brooklyn "
    //        marker.map = mapView
    //        
    //    
    //    }
    
    
}

