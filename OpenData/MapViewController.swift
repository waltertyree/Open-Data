//
//  MapViewController.swift
//  OpenData
//
//  Created by Walter Tyree on 3/12/16.
//  Copyright © 2016 Tyree Apps, LLC. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController {

    let applicationDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    @IBOutlet weak var mapView : MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView.delegate = self
        mapView.addAnnotations(applicationDelegate.listForMapView)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MapViewController.reload), name: "NOW_RELOAD", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        mapView.showAnnotations(applicationDelegate.listForMapView, animated: true)

    }
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func reload() {
        mapView.showAnnotations(applicationDelegate.listForMapView, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
        let detailView = segue.destinationViewController as? DetailViewController
        detailView?.foodInspection = sender as? FoodInspectionEntry
            detailView?.doneButtonHidden = false
        }
    }
    
    @IBAction func unwindToMap(sender: UIStoryboardSegue)
    {
        let sourceViewController = sender.sourceViewController as? DetailViewController
        sourceViewController?.doneButton.hidden = true
        // Pull any data from the view controller which initiated the unwind segue.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("recordNotification"), name: nil, object: nil)
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
        self.performSegueWithIdentifier("showDetail", sender: view.annotation)
    }
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        print("I was selected")
    }
    
}

