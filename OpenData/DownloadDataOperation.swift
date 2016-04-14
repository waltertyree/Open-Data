//
//  DownloadDataOperation.swift
//  OpenData
//
//  Created by Walter Tyree on 4/13/16.
//  Copyright © 2016 Tyree Apps, LLC. All rights reserved.
//

import UIKit

class DownloadDataOperation: NSOperation {
    let dataSource : NSURL!
    
    init(source: String) {
        if let url = NSURL(string: source) {
            self.dataSource = url
        } else {
            self.dataSource = NSURL()
        }
        super.init()
    }
    override func main() {
        /*
         let request = NSURLRequest(URL:self.dataSource)
        
         //let fileURL = NSURL(fileURLWithPath: documentsPath, isDirectory: true)
         NSURLSession.sharedSession().downloadTaskWithRequest(request) { (url, response, error) in
         do {
         
         let finalURL = fileURL.URLByAppendingPathComponent("Food.json")
         try NSFileManager.defaultManager().removeItemAtURL(finalURL)
         try NSFileManager.defaultManager().copyItemAtURL(url!, toURL: finalURL)
         
         dispatch_async(dispatch_get_main_queue(), {
         NSNotificationCenter.defaultCenter().postNotificationName("DownloadCompleted", object: nil)
         })
         
         
         } catch {
         print("error")
         }
         print(response)
         }.resume()
 */
    }
}
