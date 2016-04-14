//: Playground - noun: a place where people can play

import UIKit

var formatter = NSDateFormatter()
formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"



let myDate = formatter.dateFromString("2015-2-13T00:00:00")

formatter.dateStyle = .MediumStyle
formatter.timeStyle = .NoStyle

formatter.stringFromDate(myDate!)

let theDate = NSDate(timeIntervalSinceNow: -3600)

