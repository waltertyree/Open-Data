//
//  DetailViewController.swift
//  OpenData
//
//  Created by Walter Tyree on 3/24/16.
//  Copyright © 2016 Tyree Apps, LLC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var doneButton: UIButton!
    var artItem : ArtInstallation?
    var doneButtonHidden = true
    @IBOutlet weak var titleOfTheArt: UILabel!
   
    @IBOutlet weak var descriptionOfTheArt: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    deinit {
        artItem = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.doneButton.isHidden = self.doneButtonHidden
        
        self.titleOfTheArt.text = self.artItem?.artTitle
        self.descriptionOfTheArt.text = self.artItem?.itemDescription
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
