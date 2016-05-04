//: Learning to parse different kinds of data

import UIKit



let rawJSONData = "{\"address\":\"2300 E Yesler St\",\"artist_first_name\":\"Richard\",\"artist_last_name\":\"Spaulding\",\"classification\":\"Structures\",\"date\":\"1979\",\"description\":\"''\",\"geolocation\":{\"type\":\"Point\",\"coordinates\":[-122.301767,47.601833]},\"geolocation_city\":\"Seattle\",\"geolocation_state\":\"WA\",\"latitude\":\"47.601833\",\"location\":\"Douglas Truth Branch Library \",\"longitude\":\"-122.301767\",\"media\":\"Stained glass\",\"project\":\"DOUGLAS-TRUTH BRANCH LIBRARY\",\"sac_id\":\"PR99.077\",\"title\":\"Renouveau\"}"

let JSONAsData = rawJSONData.dataUsingEncoding(NSUTF8StringEncoding)

do {
 let JSONDictionary = try NSJSONSerialization.JSONObjectWithData(JSONAsData!, options: .AllowFragments) as! Dictionary<String, AnyObject>
    
    let singleInstallation = ArtInstallation(dictionary:JSONDictionary)


} catch let error as NSError {
    print("Could not parse: \(error)")
}




