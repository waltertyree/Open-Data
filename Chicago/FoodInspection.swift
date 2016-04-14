//
//  FoodInspection.swift
//  OpenData
//
//  Created by Walter Tyree on 3/12/16.
//  Copyright © 2016 Tyree Apps, LLC. All rights reserved.
//

/** Sample Record
{
    "license_" : "2380076",
    "zip" : "60634",
    "location" : {
        "needs_recoding" : false,
        "longitude" : "-87.77717789155297",
        "latitude" : "41.95315397886522"
    },
    "inspection_id" : "1633197",
    "state" : "IL",
    "inspection_type" : "License",
    "facility_type" : "Restaurant",
    "dba_name" : "Patio Theatre",
    "city" : "CHICAGO",
    "aka_name" : "Patio Theatre",
    "risk" : "Risk 3 (Low)",
    "inspection_date" : "2016-03-15T00:00:00",
    "results" : "Not Ready",
    "address" : "6008 W IRVING PARK RD ",
    "longitude" : "-87.77717789155297",
    "latitude" : "41.95315397886522"
}
**/

import Foundation

class FoodInspectionEntry : NSObject {
    let zip : String
    let state : String
    let facility_type : String
    let dba_name : String
    let city : String
    let aka_name : String
    let risk : String
    let inspection_date : NSDate
    let results : String
    let address : String
    let longitude : Double
    let latitude : Double
    
    init(dictionary:Dictionary<String,AnyObject>) {
        if let localZip = dictionary["zip"] as? String {
            self.zip = localZip
        } else {
            self.zip = ""
        }
        
        if let localState = dictionary["state"] as? String {
            self.state = localState
        } else {
            self.state = ""
        }
    
        if let localFacility_type = dictionary["facility_type"] as? String {
            self.facility_type = localFacility_type
        } else {
            self.facility_type = ""
        }

        if let localDba_name = dictionary["dba_name"] as? String {
            self.dba_name = localDba_name
        } else {
            self.dba_name = ""
        }
        
        if let localCity = dictionary["city"] as? String {
            self.city = localCity
        } else {
            self.city = ""
        }
        
        if let localAka_name = dictionary["aka_name"] as? String {
            self.aka_name = localAka_name
        } else {
            self.aka_name = ""
        }
        
        if let localRisk = dictionary["risk"] as? String {
            self.risk = localRisk
        } else {
            self.risk = ""
        }
        
        if let localInspection_date = dictionary["inspection_date"] as? NSDate {
            self.inspection_date = localInspection_date
        } else {
            self.inspection_date = NSDate(timeIntervalSince1970: 0)
        }
        
        if let localResults = dictionary["results"] as? String {
            self.results = localResults
        } else {
            self.results = ""
        }
        
        if let localAddress = dictionary["address"] as? String {
            self.address = localAddress
        } else {
            self.address = ""
        }

        if let localLongitude = dictionary["longitude"] as? String {
            self.longitude = Double(localLongitude)!
        } else {
            self.longitude = -87.6500500
        }
        
        if let localLatitude = dictionary["latitude"] as? String {
            self.latitude = Double(localLatitude)!
        } else {
            self.latitude = 41.8500300
        }
    }
}

extension FoodInspectionEntry : Listable {
    
    func itemTitle() -> String {
        var name = self.aka_name
        if self.aka_name != self.dba_name {
            name = self.dba_name
        }
        return name
    }
}

import CoreLocation
import MapKit

extension FoodInspectionEntry : MKAnnotation {
    var coordinate: CLLocationCoordinate2D { get {
            return CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
        }}
    
    var title: String? {
        get {
            var name = self.aka_name
            if self.aka_name != self.dba_name {
                name = self.dba_name
            }
            return name
        }
    }
//    // Title and subtitle for use by selection UI.
//    optional public var subtitle: String? { get }
}
