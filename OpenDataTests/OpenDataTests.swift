//
//  OpenDataTests.swift
//  OpenDataTests
//
//  Created by Walter Tyree on 3/17/16.
//  Copyright © 2016 Tyree Apps, LLC. All rights reserved.
//

import XCTest
@testable import OpenData

class OpenDataTests: XCTestCase {
    
    let testPayload = "{\"address\":\"13035 Linden Ave N\",\"artist_first_name\":\"Beliz\",\"artist_last_name\":\"Brother and Mark Calderon\",\"classification\":\"Sculpture\",\"date\":\"2/18/97\",\"description\":\"'A cast aluminum frieze of a repeating leaf motif along the entrance canopy, illuminated with neon.'\",\"geolocation\":{\"type\":\"Point\",\"coordinates\":[-122.348633,47.7243]},\"geolocation_city\":\"Seattle\",\"geolocation_state\":\"WA\",\"latitude\":\"47.7243\",\"location\":\"Bitter Lake Community Center, north entrance outside above door\",\"longitude\":\"-122.348633\",\"measurements\":\"24x264x2\",\"media\":\"Aluminum; bronze mesh; neon\",\"project\":\"BITTERLAKE COMMUNITY CENTER\",\"sac_id\":\"PR97.022\",\"title\":\"Aureole\"}"
    
    override class func setUp() {
        print("Class Setup")
    }
    
    override func setUp() {
        super.setUp()
        print ("Instance Setup")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        print ("Instance Teardown")
    }
    
    override class func tearDown() {
        print ("Class Teardown")
    }
    
    func testParsing() {
        
        guard let data = self.testPayload.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true) else {
            XCTFail("String was not converted to data")
            return
        }
        
        do
        {
        let anObjectJSON =  try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! Dictionary<String,AnyObject>
            let artObject = ArtInstallation(dictionary: anObjectJSON)
            
            //Now test some stuff
            XCTAssertNotNil(artObject, "Art Object was not created correctly.")
        } catch {
            XCTFail("Data was not converted to a JSON object")
        }
    }
    
    func testCreateDateFormatter() {
        // This is an example of a performance test case.
        
        
        self.measureBlock {

            let formatter = NSDateFormatter()
            formatter.timeStyle = .NoStyle
            formatter.dateStyle = .MediumStyle
            

            print("Date is: \(formatter.stringFromDate(NSDate()))")
            
        }
    }
    
}
