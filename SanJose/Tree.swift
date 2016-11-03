//
//  Tree.swift
//  OpenData
//
//  Created by Walter Tyree on 10/6/16.
//  Copyright © 2016 Tyree Apps, LLC. All rights reserved.
//

import Foundation

/*
 {
 "X": -121.84288831862408,
 "Y": 37.201927590003756,
 "OBJECTID": 2,
 "TreeID": "HT-10-007",
 "BotanicalName": "Quercus lobata",
 "CommonName": "Valley Oak",
 "Address": "7090 Calcatera Way",
 "SiteLocation": "",
 "NumberOfTreesOnSite": 1,
 "Diameter": 36,
 "Circumference": 113,
 "Description": "",
 "History": "",
 "AssociatedAPN": "",
 "CityCouncilDistrict": 10,
 "Photographed": "4/08",
 "Path": "HT-10-007.JPG"
 },
 */

class HeratigeTree: NSObject {
    var latitude: Double
    var longtitude: Double
    let botanicalName: String?
    let commonName: String?
    let info: String?
    let history: String?
    let address: String?
    
    init(withDictionary dict: Dictionary<String,AnyObject>) {
        if let latitude = dict["Y"] as? Double {
            self.latitude = latitude
        } else {
            self.latitude = Double(0.0)
        }
        
        if let longtitude = dict["X"] as? Double {
            self.longtitude = longtitude
        } else {
            self.longtitude = Double(0.0)
        }
        
        self.commonName = dict["CommonName"] as? String
        self.botanicalName = dict["BotanicalName"] as? String
        self.info = dict["Description"] as? String
        self.history = dict["History"] as? String
        self.address = dict["Address"] as? String
    }
    
}

extension HeratigeTree: Listable {
    
    func itemTitle() -> String {
        guard let title = self.commonName else {
            return ""
        }
        
        return title
    }

}

import CoreLocation
import MapKit

extension HeratigeTree : MKAnnotation {
    var coordinate: CLLocationCoordinate2D { get {
        return CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longtitude)
        }}
    
    var title: String? {
        get {
            return self.commonName
        }
    }
    //    // Title and subtitle for use by selection UI.
    //    optional public var subtitle: String? { get }
}
