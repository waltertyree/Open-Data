//
//  DownloadDataOperation.swift
//  OpenData
//
//  Created by Walter Tyree on 4/13/16.
//  Copyright © 2016 Tyree Apps, LLC. All rights reserved.
//

import UIKit

class DownloadDataOperation: NSOperation {
    
    let localFile : NSURL!
    let dataSource : NSURL!
    
    init(source: NSURL?, file: NSURL?) {
        self.dataSource = source
        self.localFile = file
        super.init()
    }
    
    override func main() {
        guard dataSource != nil else {
            print("DataSource variable is nil. Aborting.")
            return
        }
        
        guard localFile != nil else {
            print("Local file is nil. Aborting.")
            return
        }
        
        
        
        let request = NSURLRequest(URL:self.dataSource)

        NSURLSession.sharedSession().downloadTaskWithRequest(request) { (url, response, err) in
            
            
                do {
                    if let err = err {
                        throw err
                    }
            
                try NSFileManager.defaultManager().removeItemAtURL(self.localFile)
                try NSFileManager.defaultManager().copyItemAtURL(url!, toURL: self.localFile)
                
                    dispatch_async(dispatch_get_main_queue(), { 
                        NSNotificationCenter.defaultCenter().postNotificationName(Notifications.DOWNLOAD_COMPLETE, object: nil)
                    })

                } catch let error as NSError {
                    print("error is \(error)")
            }
                print("Printing the response for debugging purposes \(response)")
            }.resume()
        
    }
}
