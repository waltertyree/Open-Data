//
//  CustomTableViewCell.swift
//  OpenData
//
//  Created by Walter Tyree on 3/12/16.
//  Copyright © 2016 Tyree Apps, LLC. All rights reserved.
//

import UIKit
import MapKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var Address: UILabel!
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var map: MKMapView!
}
