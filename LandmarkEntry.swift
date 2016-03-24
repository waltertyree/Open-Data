//
//  LandmarkEntry.swift
//  OpenData
//
//  Created by Walter Tyree on 3/12/16.
//  Copyright © 2016 Tyree Apps, LLC. All rights reserved.
//

import UIKit
/**Sample JSON entry
 {
 "architect" : "Richard E. Schmidt",
 "id" : "L-194",
 "location" : {
 "needs_recoding" : false,
 "longitude" : "-87.6395390064",
 "latitude" : "41.9275524015"
 },
 "landmark_designation_date" : 303116400,
 "address" : "2466 N Lakeview Av",
 "landmark_name" : "Theurer-Wrigley House",
 "longitude" : "-87.63953900640",
 "latitude" : "41.92755240150",
 "date_built" : "1896"
 }
 */

class LandmarkEntry: NSObject {
    let architect : String
    let id : String
    let designationDate : NSDate
    let address : String
    let landmarkName : String
    let longitude : Double
    let latitude : Double
    let dateBuilt : String
    
    init(dictionary:Dictionary<String,AnyObject>) {
        if let localArchitect = dictionary["architect"] as? String {
            self.architect = localArchitect
        } else {
            self.architect = ""
        }
        
        if let localId = dictionary["id"] as? String {
            self.id = localId
        } else {
            self.id = ""
        }

        if let localDesignationDate = dictionary["landmark_designation_date"] as? Double {
            self.designationDate = NSDate(timeIntervalSince1970: localDesignationDate)
        } else {
            self.designationDate = NSDate(timeIntervalSince1970: 0.0)
        }
        
        if let localAddress = dictionary["address"] as? String {
            self.address = localAddress
        } else {
            self.address = ""
        }

        if let localLandmarkName = dictionary["landmark_name"] as? String {
            self.landmarkName = localLandmarkName
        } else {
            self.landmarkName = ""
        }
        
        if let localLongitude = dictionary["longitude"] as? String {
            self.longitude = Double(localLongitude)!
        } else {
            self.longitude = 0.0
        }
        
        if let localLatitude = dictionary["latitude"] as? String {
            self.latitude = Double(localLatitude)!
        } else {
            self.latitude = 0.0
        }
        
        if let localDateBuilt = dictionary["date_built"] as? String {
            self.dateBuilt = localDateBuilt
        } else {
            self.dateBuilt = ""
        }

    }
}


extension LandmarkEntry : Listable {
    
    func itemTitle() -> String {
        return self.landmarkName
    }
}

import CoreLocation
import MapKit

extension LandmarkEntry : Mappable, MKAnnotation {
    var coordinate: CLLocationCoordinate2D { get {
        return CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
        }}
    
    var title: String? {
        get {
            return self.landmarkName
        }
    }
    //    // Title and subtitle for use by selection UI.
    //    optional public var subtitle: String? { get }
}
