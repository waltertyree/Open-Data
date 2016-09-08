//
//  CafeObject.swift
//  OpenData
//
//  Created by Developer Tyree on 9/8/16.
//  Copyright © 2016 Tyree Apps, LLC. All rights reserved.
//

import UIKit

/*
{"type":"Feature",
 "properties":{"OBJECTID_1":1,
                "OBJECTID":1,
                "SQUARE":"0004",
                "SUFFIX":"N",
                "LOT":"2029",
                "IDNUM":"S693",
                "OWNER":"VITTORIO TESTE",
                "ADDRESS":"2600 PENNSYLVANIA AVE NW",
                "AREA_":"787.50",
                "X":395220.84,
                "Y":137348.04,
                "ADDRID":274801},
 "geometry":{"type":"Point",
             "coordinates":[-77.05510045288864,38.90398314039506]}}
 */


class CafeObject: NSObject {
    var owner: String = ""
    var lat: Double = Double(0.0)
    var lon: Double = Double(0.0)
    
    init(entry: Dictionary<String,AnyObject>) {
        
        if let properties = entry["properties"] as? Dictionary<String,AnyObject> {
        if let localOwner = properties["OWNER"] as? String {
            owner = localOwner
        }
        }
        
        if let geometry = entry["geometry"] as? Dictionary<String, AnyObject> {
            if let coordinates = geometry["coordinates"] as? Array<Double> {
                lat = coordinates.first ?? Double(0.0)
                lon = coordinates.last ?? Double(0.0)
            }
        }
    }
    
}

extension CafeObject: Listable {

    func itemTitle() -> String {
        return self.owner
    }
}

import CoreLocation
import MapKit

extension CafeObject : MKAnnotation {
    var coordinate: CLLocationCoordinate2D { get {
        return CLLocationCoordinate2D(latitude: self.lat, longitude: self.lon)
        }}
    
    
    var title: String? {
        get {
            return self.owner
        }
    }
    
    
    //    // Title and subtitle for use by selection UI.
    //    optional public var subtitle: String? { get }
}




