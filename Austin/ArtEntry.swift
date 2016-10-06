//
//  ArtEntry.swift
//  OpenData
//
//  Created by Walter Tyree on 4/7/16.
//  Copyright © 2016 Tyree Apps, LLC. All rights reserved.
//

import UIKit
/*
 {
 "art_location_city" : "Austin",
 "art_location_name" : "Austin Convention Center Parking Garage/Chiller Tower",
 "location" : {
 "needs_recoding" : false,
 "longitude" : "-97.73647200312456",
 "latitude" : "30.265255505104278",
 "human_address" : "{\"address\":\"5th Street and Sabine Street;\",\"city\":\"Austin\",\"state\":\"TX\",\"zip\":\"78701\"}"
 },
 "art_location_zip" : "78701",
 "artist_full_name" : "Ann M.Adams",
 "web_detail_page" : "http://www.austintexas.gov/aipp/aipp_detail.cfm?art=504 ",
 "images" : "http://assets.austintexas.gov/aipp/images/pic2005_003_1.jpg;http://assets.austintexas.gov/aipp/images/pic2005_003_2.jpg;http://assets.austintexas.gov/aipp/images/pic2005_003_3.jpg;",
 "art_location_street_address" : "5th Street and Sabine Street;",
 "art_title" : "Big Chiller Blues",
 "art_location_state" : "TX"
 }
 */
import CoreLocation
struct LocationStruct {
    /*
     "location" : {
     "needs_recoding" : false,
     "longitude" : "-97.73647200312456",
     "latitude" : "30.265255505104278",
     "human_address" : "{\"address\":\"5th Street and Sabine Street;\",\"city\":\"Austin\",\"state\":\"TX\",\"zip\":\"78701\"}"
     },
     */
    let kDefaultLatitude : Double = -97.73647200312456
    let kDefaultLongitude : Double = 30.265255505104278
    
    var latitude : Double!
    var longitude : Double!
    let readable : Dictionary<String,AnyObject>!
    
    init(dict:Dictionary<String,AnyObject>) {
        if let lat = dict["latitude"] as? String {
            latitude = Double(lat)
        } else {
            latitude = kDefaultLatitude
        }
        
        if let long = dict["longitude"] as? String  {
            longitude = Double(long)
        } else {
            longitude = kDefaultLongitude
        }
        
        if let address = dict["human_address"] as? String {
            if let data = address.data(using: String.Encoding.utf8) {
                do {
                    
                    let dataDictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? Dictionary<String,AnyObject>
                    readable = dataDictionary
                } catch let error {
                    print(error)
                    readable = Dictionary<String,AnyObject>()
                }
            } else {
                readable = Dictionary<String,AnyObject>()
            }
        } else {
            readable = Dictionary<String,AnyObject>()
        }
        
        if self.latitude == kDefaultLatitude && self.longitude == kDefaultLongitude {
            let location = self.locationFromAddress()
            self.latitude = location.latitude
            self.longitude = location.longitude
        }
    }
    
    func locationFromAddress() -> CLLocationCoordinate2D {

        var locationToReturn = CLLocationCoordinate2D(latitude:kDefaultLatitude, longitude:kDefaultLongitude)

        CLGeocoder().geocodeAddressString("\(readable["address"]) \(readable["city"]), \(readable["state"])  \(readable["zip"])") {(placemarks, error) in
            if let placemark = placemarks?.first, let plLocation = placemark.location {
               locationToReturn = plLocation.coordinate
            }
        }
        return locationToReturn
    }
}

class ArtEntry: NSObject {
    let artistFullName : String?
    var artLocationCity : String? {
        willSet {
            willChangeValue(forKey: "artLocationCity")
        }
        
        didSet {
            didChangeValue(forKey: "artLocationCity")
        }

    }
    let artLocationState : String?
    let artLocationAddress : String?
    let artLocationZip : String?
    let artTitle : String?
    let artImages : Array<String>?
    let artWebDetailPage : String?
    let artLocation : LocationStruct?
    
    init(dictionary : Dictionary<String, AnyObject>) {
        
        self.artLocationCity = dictionary["art_location_city"] as? String
        self.artistFullName = dictionary["artist_full_name"] as? String
        self.artLocationState = dictionary["art_location_state"] as? String
        self.artLocationAddress = dictionary["art_location_street_address"] as? String
        self.artLocationZip = dictionary["art_location_zip"] as? String
        self.artTitle = dictionary["art_title"] as? String
        if let imagesString = dictionary["images"] as? String {
            self.artImages = imagesString.characters.split(separator: ";").map(String.init)
        } else {
            self.artImages = nil
        }
        self.artWebDetailPage = dictionary["web_detail_page"] as? String
        
        if let location = dictionary["location"] as? Dictionary<String, AnyObject> {
            self.artLocation = LocationStruct(dict:location)
        } else {
            self.artLocation = LocationStruct(dict: Dictionary<String, AnyObject>())
        }
        
        
        super.init()
        
    }
}

extension ArtEntry : Listable {
    
    func itemTitle() -> String {
        if let artTitle = self.artTitle {
            return artTitle
        }
        return ""
    }
}

import CoreLocation
import MapKit

extension ArtEntry : MKAnnotation {
    var coordinate: CLLocationCoordinate2D { get {
        return CLLocationCoordinate2D(latitude: self.artLocation!.latitude, longitude: self.artLocation!.longitude)
        }}
    
    var title: String? {
        get {
            return self.artTitle
        }
    }
    
    
    //    // Title and subtitle for use by selection UI.
    //    optional public var subtitle: String? { get }
}

