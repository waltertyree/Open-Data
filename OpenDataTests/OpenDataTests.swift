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
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let myEntry = ArtEntry(dictionary: ["art_location_city":"Austin"])
        
        keyValueObservingExpectationForObject(myEntry, keyPath: "artLocationCity", expectedValue: "Boston")
        
        myEntry.artLocationCity = "Boston"
        
        waitForExpectationsWithTimeout(1.0) { (error) in
            //Expectation was not met
        }
        
        
        
        
        print("Test Example")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
