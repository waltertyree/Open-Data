//
//  publicArt.swift
//  OpenData
//
//  Created by Walter Tyree on 5/4/16.
//  Copyright © 2016 Tyree Apps, LLC. All rights reserved.
//

import Foundation


public class ArtInstallation: NSObject {
    let address : String?
    let artistFirstName : String?
    let artistLastName : String?
    let classification : String?
    let date : String?
    let itemDescription: String?
    let city : String?
    let state : String?
    let location : String?
    let latitude : Double?
    let longitude : Double?
    let media : String?
    let project : String?
    let sacId : String?
    let artTitle : String?
    
    
    public init(dictionary: Dictionary<String, AnyObject>) {
        self.city = dictionary["geolocation_city"] as? String
        self.artistFirstName = dictionary["artist_first_name"] as? String
        self.artistLastName = dictionary["artist_last_name"] as? String
        self.state = dictionary["art_location_state"] as? String
        self.address = dictionary["address"] as? String
        self.artTitle = dictionary["title"] as? String
        self.classification = dictionary["classification"] as? String
        self.date = dictionary["date"] as? String
        self.itemDescription = dictionary["description"] as? String
        self.location = dictionary["location"] as? String
        
        if let latitude = dictionary["latitude"] as? String {
            self.latitude = Double(latitude)
        } else {
            self.latitude = 0.0
        }
        
        if let longitude = dictionary["longitude"] as? String {
            self.longitude = Double(longitude)
        } else {
            self.longitude = 0.0
        }
        
        self.media = dictionary["media"] as? String
        self.project = dictionary["project"] as? String
        self.sacId = dictionary["sac_id"] as? String
        
    }
}


extension ArtInstallation : Listable {
    
    func itemTitle() -> String {
        if let title = self.artTitle {
            return title
        }
        return ""
    }
}

import CoreLocation
import MapKit

extension ArtInstallation : MKAnnotation {
    public var coordinate: CLLocationCoordinate2D { get {
        return CLLocationCoordinate2D(latitude: self.latitude!, longitude: self.longitude!)
        }}
    
    
    public var title: String? {
        get {
            return self.title
        }
    }
    
    
    //    // Title and subtitle for use by selection UI.
    //    optional public var subtitle: String? { get }
}
