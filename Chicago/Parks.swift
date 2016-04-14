//
//  Parks.swift
//  OpenData
//
//  Created by Walter Tyree on 3/12/16.
//  Copyright © 2016 Tyree Apps, LLC. All rights reserved.
//

import Foundation

enum Amenity : String {
    case SkatePark = "skate_park"
    case Wetland = "wetland_area"
    case Conservatory = "conservatory"
    case SletHill = "sled_hill"
    case FootballSoccer = "football_soccer_combo"
    case BasketballBackboards = "basketball_backboards"
    case Beach = "beach"
    case PuttingGreens = "golf_putting_greens"
    case Zoo = "zoo"
    case WaterPark = "water_playground"
    case LillyPond = "alfred_caldwell_lilly_pond"
    case Baseball = "baseball_sr"
    case Shuffleboard = "shuffleboard"
    case ToyBoatPond = "model_yacht_basin"
    case BoatSlips = "boat_slips"
    case SprayFeature = "spray_feature"
    case LawnBowling = "bowling_green"
    case DrivingRange = "golf_driving_range"
    case CastingArea = "casting_area"
    case WaterSlide = "water_slide"
    case BoatLaunchMotorized = "boat_launch_motorized"
    case Lagoon = "lagoon"
    case BandShell = "band_shell"
    case AccessibleBallField = "wheelchair_accessible_ball_fields"
    case PlaygroundPark = "playground_park"
    case Volleyball = "volleyball"
    case DogFriendly = "dog_friendly"
    case BoatLaunchManual = "boat_launch_non_motorized"
    case GymnasticCenter = "gymnastic_centers"
    case FitnessCourse = "fitness_courses"
    case BattingCage = "baseball_batting_cages"
    case GolfCourse = "golf_course"
    case Rowing = "rowing_club"
    case FitnessCenter = "fitness_center"
    case CricketField = "cricket_field"
    case BoxingCenter = "boxing_center"
    case BaseballKids = "baseball_jr_softball_t_ball"
    case Bocce = "bocce_court"
    case IceRink = "ice_skating"
    case OutdoorPool = "pool_outdoor"
    case Horseshoes = "horseshoe_courts"
    case NatureCenter = "nature_center"
    case Chess = "chess_pavillion"
    case Carousel = "carousel"
    case Playground = "playground"
    case CulturalCenter = "cultural_center"
    case BeachVolleyball = "volleyball_sand"
    case Handball = "handball"
    case SeniorCenter = "senior_center"
    case MountainBikeTrail = "mountain_bike_trail"
    case Gallery = "gallery"
    case Raquetball = "handball_raquetball_court"
    case Track = "track"
    case TurfField = "artificial_turf_fields"
    case Gymnasium = "gymnasium"
    case ModelTrain = "model_train_display"
    case RollerRink = "sport_roller_courts"
    case BasketballCourt = "basketball_courts"
    case ArcheryRange = "archery_range"
    case Pavillion = "pavillion"
    case PuttPutt = "golf_course_miniature"
    case CommunityGarden = "community_garden"
    case Garden = "garden"
    case IndoorPool = "pool_indoor"
    case Croquet = "croquet"
    case Tennis = "tennis_courts"
    
}
/** Sample Record
 {
 "skate_park" : "0",
 "wetland_area" : "0",
 "conservatory" : "0",
 "location" : {
 "needs_recoding" : false,
 "longitude" : "-87.64760634977873",
 "latitude" : "41.702483087590934",
 "human_address" : "{\"address\":\"10540 S MORGAN ST\",\"city\":\"\",\"state\":\"\",\"zip\":\"60643\"}"
 },
 "sled_hill" : "0",
 "football_soccer_combo" : "0",
 "basketball_backboards" : "4",
 "beach" : "0",
 "golf_putting_greens" : "0",
 "zoo" : "0",
 "water_playground" : "0",
 "alfred_caldwell_lily_pond" : "0",
 "baseball_sr" : "2",
 "shuffleboard" : "0",
 "model_yacht_basin" : "0",
 "boat_slips" : "0",
 "spray_feature" : "0",
 "bowling_green" : "0",
 "golf_driving_range" : "0",
 "casting_area" : "0",
 "water_slide" : "0",
 "boat_launch_motorized" : "0",
 "lagoon" : "0",
 "band_shell" : "0",
 "wheelchair_accessible_ball_fields" : "0",
 "playground_park" : "0",
 "volleyball" : "0",
 "dog_friendly" : "0",
 "boat_launch_non_motorized" : "0",
 "label" : "Robinson",
 "gymnastic_centers" : "0",
 "ward" : "34",
 "fitness_courses" : "0",
 "baseball_batting_cages" : "0",
 "golf_course" : "0",
 "rowing_club" : "0",
 "fitness_center" : "0",
 "cricket_field" : "0",
 "boxing_center" : "0",
 "baseball_jr_softball_t_ball" : "2",
 "bocce_court" : "0",
 "ice_skating" : "0",
 "pool_outdoor" : "0",
 "horseshoe_courts" : "0",
 "nature_center" : "0",
 "chess_pavillion" : "0",
 "park_number" : "236",
 "carousel" : "0",
 "volleyball_sand" : "0",
 "cultural_center" : "0",
 "handball" : "0",
 "acres" : "16.79",
 "senior_center" : "0",
 "mountain_bike_trail" : "0",
 "playground" : "1",
 "zip" : "60643",
 "gallery" : "0",
 "handball_raquetball_court" : "0",
 "track" : "0",
 "park_name" : "ROBINSON (JACKIE)",
 "artificial_turf_fields" : "0",
 "gymnasium" : "0",
 "model_train_display" : "0",
 "sport_roller_courts" : "0",
 "basketball_courts" : "1",
 "park_class" : "REGIONAL PARK",
 "archery_range" : "0",
 "pavillion" : "0",
 "golf_course_miniature" : "0",
 "community_garden" : "0",
 "street_address" : "10540 S MORGAN ST",
 "garden" : "0",
 "pool_indoor" : "0",
 "croquet" : "0",
 "tennis_courts" : "0"
 }
 **/


class ParkAmenitiesEntry : NSObject {
    let zip : String
    let state : String
    let park_class : String
    let park_name : String
    let acerage : String
    let ward : String
    let label : String
    let park_number : String
    let amenities : Array<Dictionary<Amenity,Int>>
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
        
        if let localPark_class = dictionary["park_class"] as? String {
            self.park_class = localPark_class
        } else {
            self.park_class = ""
        }
        
        if let localAcerage = dictionary["acres"] as? String {
            self.acerage = localAcerage
        } else {
            self.acerage = ""
        }
        
        if let localWard = dictionary["ward"] as? String {
            self.ward = localWard
        } else {
            self.ward = ""
        }
        
        if let localLabel = dictionary["label"] as? String {
            self.label = localLabel
        } else {
            self.label = ""
        }
        
        if let localPark_number = dictionary["park_number"] as? String {
            self.park_number = localPark_number
        } else {
            self.park_number = ""
        }
        
        if let localPark_name = dictionary["park_name"] as? String {
            self.park_name = localPark_name
        } else {
            self.park_name = ""
        }
        
        
        if let localAddress = dictionary["street_address"] as? String {
            self.address = localAddress
        } else {
            self.address = ""
        }
        
        if let locationDict = dictionary["location"] {
            
        if let localLongitude = locationDict["longitude"] as? String {
            self.longitude = Double(localLongitude)!
        } else {
            self.longitude = 0.0
        }
        
        if let localLatitude = locationDict["latitude"] as? String {
            self.latitude = Double(localLatitude)!
        } else {
            self.latitude = 0.0
        }
        } else {
            self.latitude = 0.0
            self.longitude = 0.0
        }
        var amenityArray = Array<Dictionary<Amenity,Int>>()
        for (keyName,countValue) in dictionary {
            if let countValue = countValue as? String, integerCount = Int(countValue), amenity = Amenity(rawValue: keyName) {
                if integerCount > 0 {
                    amenityArray.append([amenity:integerCount])
                }
            }
                
            }
        self.amenities = amenityArray
    }
}

extension ParkAmenitiesEntry : Listable {
    
    func itemTitle() -> String {
        let name = self.park_name
        return name
    }
}

import CoreLocation
import MapKit

extension ParkAmenitiesEntry : MKAnnotation {
    var coordinate: CLLocationCoordinate2D { get {
        return CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
        }}
    
    var title: String? {
        get {
            return self.park_name
        }
    }
    //    // Title and subtitle for use by selection UI.
    //    optional public var subtitle: String? { get }
}
