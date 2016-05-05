import Foundation


public class ArtInstallation: NSObject {
    let address : String?
    let artistFirstName : String?
    let artistLastName : String?
    let classification : String?
    let date : String?

    
    
    public init(dictionary: Dictionary<String, AnyObject>) {
        
        self.artistFirstName = dictionary["artist_first_name"] as? String
        self.artistLastName = dictionary["artist_last_name"] as? String
        
        self.address = dictionary["address"] as? String
        
        self.classification = dictionary["classification"] as? String
        self.date = dictionary["date"] as? String
        
    }
}
