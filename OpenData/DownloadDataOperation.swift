//
//  DownloadDataOperation.swift
//  OpenData
//
//  Created by Walter Tyree on 4/13/16.
//  Copyright © 2016 Tyree Apps, LLC. All rights reserved.
//

import UIKit

class DownloadDataOperation: Operation {
    
    let localFile : URL!
    let dataSource : URL!
    
    init(source: URL?, file: URL?) {
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
        
        
        
        let request = URLRequest(url:self.dataSource)

        URLSession.shared.downloadTask(with: request, completionHandler: { (url, response, err) in
            
            
                do {
                    if let err = err {
                        throw err
                    }
            
                try FileManager.default.removeItem(at: self.localFile)
                try FileManager.default.copyItem(at: url!, to: self.localFile)
                
                    DispatchQueue.main.async(execute: { 
                        NotificationCenter.default.post(name: Notification.Name(rawValue: Notifications.DOWNLOAD_COMPLETE), object: nil)
                    })

                } catch let error as NSError {
                    print("error is \(error)")
            }
                print("Printing the response for debugging purposes \(response)")
            }) .resume()
        
    }
}
