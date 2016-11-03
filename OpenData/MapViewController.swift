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
        
        NotificationCenter.default.addObserver(self, selector: #selector(MapViewController.reload), name: NSNotification.Name(rawValue: Notifications.ARRAYS_RELOADED), object: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //        locationManager.requestWhenInUseAuthorization()
        //        locationManager.startUpdatingLocation()
        //
        mapView.showAnnotations(applicationDelegate.listForMapView, animated: true)
        self.reload()
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func reload() {
        mapView.showAnnotations(applicationDelegate.listForMapView, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.last ?? CLLocation(latitude: 0.0, longitude: 0.0))
    }
}

extension MapViewController : MKMapViewDelegate {
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let theView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "place")
        //        theView.canShowCallout = true
        //        theView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        return theView
        
    }
    
    /*
     func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
     print("I was tapped")
     if let navigationController = self.navigationController, let detailVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
     detailVC.tree = view.annotation as? HeratigeTree
     navigationController.pushViewController(detailVC, animated: true)
     }
     }
     
     func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
     print("I was selected")
     }
     */
}

