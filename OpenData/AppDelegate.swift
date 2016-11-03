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
    static let kDataFileName = "heritage_trees.json"
    static let kDataRemoteURL = URL(string:"") //NSURL(string:"<#And This#>")
}

struct Notifications {
    static let DOWNLOAD_COMPLETE = "DOWNLOAD_COMPLETE"
    static let ARRAYS_RELOADED = "ARRAYS_RELOADED"
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let workQueue = OperationQueue()
    
    //These lists will supply the data for the tableview and the map
    var listForTableView = Array<Listable>()
    var listForMapView = Array<MKAnnotation>()
    
    //Whenever the app launches this will fire. When the app is
    //just going to the background or foreground (i.e. coming from
    //sleep) one of the methods below will get called.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //At the end of the download, it will post a notification.
        //Watch for that notification by name
        NotificationCenter.default.addObserver(self, selector: #selector(AppDelegate.populateArrays), name: NSNotification.Name(rawValue: Notifications.DOWNLOAD_COMPLETE), object: nil)
        
        
        
        
        //Read the header info about checkResourceIsReachableAndReturnError for a note about efficiency.
        var err : NSError? = nil
        guard let destinationURL = fetchDestinationURL() else {
            return false
        }
        
        if !(destinationURL as NSURL).checkResourceIsReachableAndReturnError(&err) {
            
            let sourceURL = Bundle.main.url(forResource: DataConstants.kDataFileName, withExtension: "")!
            
            
            do{
                try FileManager.default.copyItem(at: sourceURL, to: destinationURL)
            } catch let error as NSError {
                print ("could not copy file because of \(error.localizedDescription)")
            }
            
        } else {
            print("An error occurred when we tried to find the file \(err.debugDescription)")
        }
        
        populateArrays()
        
        
        
        return true
        
    }
    
    func populateArrays() {
        self.listForMapView.removeAll()
        self.listForTableView.removeAll()
        
        
        if let fileURL = fetchDestinationURL(), let data = try? Data(contentsOf: fileURL) {
            do {
                
                let data: Array<Dictionary<String, AnyObject>> = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! Array<Dictionary<String, AnyObject>>
                
                
                for entry in data {
                    let populatedEntry = HeratigeTree(withDictionary: entry)
                    self.listForTableView.append(populatedEntry)
                    self.listForMapView.append(populatedEntry)
                }
                NotificationCenter.default.post(name: Notification.Name(rawValue: Notifications.ARRAYS_RELOADED), object: nil)
                
            } catch let error as NSError {
                print("JSON Serialization failed \(error.localizedDescription)")
            }
        }
        
        
    }
    
    fileprivate func fetchDestinationURL() -> URL? {
        
        guard let documentsURL = fetchDocumentsDirectoryURL() else {
            return nil
        }
        
        let destinationURL = documentsURL.appendingPathComponent(DataConstants.kDataFileName)
        
        return destinationURL
        
    }
    
    fileprivate func fetchDocumentsDirectoryURL() -> URL? {
        
        let documentsURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        
        return documentsURL
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        let downloadOperation = DownloadDataOperation(source: DataConstants.kDataRemoteURL, file: fetchDestinationURL())
        self.workQueue.addOperation(downloadOperation)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

