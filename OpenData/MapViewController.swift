//
//  MapViewController.swift
//  OpenData
//
//  Created by Walter Tyree on 3/17/16.
//  Copyright © 2016 Tyree Apps, LLC. All rights reserved.
//

import UIKit
import MapKit

protocol Mappable {
    
}

class MapViewController: UIViewController {

    let applicationDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    @IBOutlet weak var mapView : MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView.delegate = self
        mapView.addAnnotations(applicationDelegate.listForMapView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        mapView.showAnnotations(applicationDelegate.listForMapView, animated: true)

    }
    
    @IBAction func unwindToMap(sender: UIStoryboardSegue)
    {
        let sourceViewController = sender.sourceViewController
        // Pull any data from the view controller which initiated the unwind segue.
    }
}

extension MapViewController : MKMapViewDelegate {
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let theView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "place")
        theView.canShowCallout = true
        theView.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure)
    return theView
        
    }
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("I was tapped")
    }
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        print("I was selected")
    }
    
}

