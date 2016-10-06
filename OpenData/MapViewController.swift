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

    let applicationDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet weak var mapView : MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        mapView.delegate = self
        mapView.addAnnotations(applicationDelegate.listForMapView)
        
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MapViewController.reload), name: Notifications.ARRAYS_RELOADED, object: nil)
    }


    override func viewWillAppear(_ animated: Bool) {
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
    

    */
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.last)
    }
}

extension MapViewController : MKMapViewDelegate {
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let theView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "place")
//        theView.canShowCallout = true
//        theView.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure)
    return theView
        
    }
     
     
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("I was tapped")
        //self.performSegueWithIdentifier("showDetail", sender: view.annotation)
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("I was selected")
    }
    
}

