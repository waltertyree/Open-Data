//
//  MapViewController.swift
//  OpenData
//
//  Created by Walter Tyree on 3/12/16.
//  Copyright © 2016 Tyree Apps, LLC. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController, CLLocationManagerDelegate {

    let applicationDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    @IBOutlet weak var mapView : MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        mapView.delegate = self
        mapView.addAnnotations(applicationDelegate.listForMapView)
        
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MapViewController.reload), name: Notifications.ARRAYS_RELOADED, object: nil)
    }


    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.showAnnotations(applicationDelegate.listForMapView, animated: true)

    }
    
   /* deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func reload() {
        mapView.showAnnotations(applicationDelegate.listForMapView, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
        let detailView = segue.destinationViewController as? DetailViewController
        detailView?.artItem = sender as? ArtInstallation
            detailView?.doneButtonHidden = false
        }
    }
    
    @IBAction func unwindToMap(sender: UIStoryboardSegue)
    {
        let sourceViewController = sender.sourceViewController as? DetailViewController
        sourceViewController?.doneButton.hidden = true
        // Pull any data from the view controller which initiated the unwind segue.
        
    }
    */
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        print(newLocation)
    }
}

extension MapViewController : MKMapViewDelegate {
    
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let theView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "place")
//        theView.canShowCallout = true
//        theView.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure)
    return theView
        
    }
     
     
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("I was tapped")
        //self.performSegueWithIdentifier("showDetail", sender: view.annotation)
    }
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        print("I was selected")
    }
    
}

