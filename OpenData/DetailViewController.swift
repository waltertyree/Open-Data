//
//  DetailViewController.swift
//  OpenData
//
//  Created by Walter Tyree on 3/24/16.
//  Copyright © 2016 Tyree Apps, LLC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var artItem : ArtInstallation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    deinit {
        artItem = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
}
