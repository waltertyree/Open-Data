//: Playground - noun: a place where people can play

import UIKit
import OpenData


var art = OpenData.ArtEntry
var formatter = NSDateFormatter()

formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

let myDate = formatter.dateFromString("2015-2-13T00:00:00")

formatter.dateStyle = .FullStyle
formatter.timeStyle = .FullStyle

/*Other styles are:
     NoStyle
     ShortStyle
     MediumStyle
     LongStyle
     FullStyle
 */

formatter.stringFromDate(myDate!)

let accurateSubtraction = NSCalendar.autoupdatingCurrentCalendar().dateByAddingUnit(.Day, value: -1, toDate: NSDate(), options: [.WrapComponents])

let lessThanAccurate = NSDate().dateByAddingTimeInterval(-86400)

