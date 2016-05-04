//: Playground - noun: a place where people can play

import UIKit
import OpenData


var art = OpenData.ArtEntry
var formatter = NSDateFormatter()
//2016-03-12T13:00:12
formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

let myDate = formatter.dateFromString("2015-2-13T00:00:00")

formatter.dateStyle = .FullStyle
formatter.timeStyle = .FullStyle

formatter.stringFromDate(myDate!)

let theDate = NSDate(timeIntervalSinceNow: 3600)
let addTime = NSDateComponents.day
let theNewDate = NSCalendar.autoupdatingCurrentCalendar().dateByAddingComponents(NSDateComponents.init(, toDate: NSDate(), options: nil)

