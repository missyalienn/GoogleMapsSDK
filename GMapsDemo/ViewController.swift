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
        let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: 48.857165, longitude: 2.354613, zoom: 8.0)
        viewMap.camera = camera
        
        
     
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    
}

