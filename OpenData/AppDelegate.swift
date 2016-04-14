//
//  AppDelegate.swift
//  OpenData
//
//  Created by Walter Tyree on 3/12/16.
//  Copyright © 2016 Tyree Apps, LLC. All rights reserved.
//

import UIKit
import MapKit

struct DataConstants {
    static let kDataFileName = "CityArtworks.json"
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    //let workQueue = NSOperationQueue()
    
    //These lists will supply the data for the tableview and the map
    var listForTableView = Array<Listable>()
    var listForMapView = Array<MKAnnotation>()
    
    //Whenever the app launches this will fire. When the app is
    //just going to the background or foreground (i.e. coming from
    //sleep) one of the methods below will get called.
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //At the end of the download, it will post a notification.
        //Watch for that notification by name
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AppDelegate.populateArrays), name: "DownloadCompleted", object: nil)
        
        let documentsURL = fetchDocumentsDirectoryURL()
        
        let destinationURL = documentsURL.URLByAppendingPathComponent("/\(DataConstants.kDataFileName)")
            
            var error : NSError? = nil
            if !destinationURL.checkResourceIsReachableAndReturnError(&error) {
                
                let sourceURL = NSBundle.mainBundle().URLForResource(DataConstants.kDataFileName, withExtension: "")!
                do{
                    try NSFileManager.defaultManager().copyItemAtURL(sourceURL, toURL: destinationURL)
                } catch {
                    print ("could not copy file")
                }
            } else {
                print("An error occurred when we tried to find the file \(error.debugDescription)")
            }
        
        populateArrays()
        
        return true
    }
    
    func populateArrays() {
        self.listForMapView.removeAll()
        self.listForTableView.removeAll()
        
        let documentsURL = fetchDocumentsDirectoryURL()
        
        let fileURL = documentsURL.URLByAppendingPathComponent(DataConstants.kDataFileName)
        
        if let data = NSData(contentsOfURL:fileURL) {
            do {
                
                let dataList = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as? Array<Dictionary<String,AnyObject>>
                
                for entry in dataList! {
                    let populatedEntry = ArtEntry.init(dictionary: entry)
                    self.listForTableView.append(populatedEntry)
                    self.listForMapView.append(populatedEntry)
                }
//                NSNotificationCenter.defaultCenter().postNotificationName("NOW_RELOAD", object: nil)
            } catch let error {
                print(error)
            }
        }
        
        
    }
    
    func fetchDocumentsDirectoryURL() -> NSURL {
        var documentsURL = NSURL()
        
        do {
            
            documentsURL = try NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false)
        } catch {
            print("Could not find documents directory")
        }
return documentsURL
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

