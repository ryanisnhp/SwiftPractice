//
//  Coffee.swift
//  RealmStarted
//
//  Created by Lam Le Van on 8/25/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import QuadratTouch
import MapKit
import RealmSwift

struct API {
    struct notifications {
        static let venuesUpdated = "venues updated"
    }
}

struct Owner {
    static let clientID = "4KVGMK1XQ4NDMUZ321VFBV1V5ODMJTF4K4NPSCEOGQ1AWZAV"
    static let clientSecret = "FJOXAKD1OL3EGPR0CD0Y3EFTU1C0EYTIFT2WSQZ2UFWNB13M"
}


class CoffeeAPI {
    static let sharedInstance = CoffeeAPI()
    var session: Session?
    
    init() {
        let client = Client(clientID: Owner.clientID, clientSecret: Owner.clientSecret, redirectURL: "")
        let configuration = Configuration(client: client)
        Session.setupSharedSessionWithConfiguration(configuration)
        self.session = Session.sharedSession()
    }
    
    func getCoffeeShopWithLocation(location: CLLocation) {
        if let session = self.session {
            var parameters = location.paramter()
            parameters += [Parameter.categoryId: "4bf58dd8d48988d1e0931735"]
            parameters += [Parameter.radius: "2000"]
            parameters += [Parameter.limit: "50"]
            
            // Start a "search", i.e. an async call to Foursquare that should return venue data
            let searchTask = session.venues.search(parameters)
                {
                    (result) -> Void in
                    
                    if let response = result.response
                    {
                        if let venues = response["venues"] as? [[String: AnyObject]]
                        {
                            autoreleasepool
                                {
                                    let realm = try! Realm(); // Note: no error handling
                                    realm.beginWrite();
                                    
                                    for venue:[String: AnyObject] in venues
                                    {
                                        let venueObject:Venue = Venue();
                                        
                                        if let id = venue["id"] as? String
                                        {
                                            venueObject.id = id;
                                        }
                                        
                                        if let name = venue["name"] as? String
                                        {
                                            venueObject.name = name;
                                        }
                                        
                                        if  let location = venue["location"] as? [String: AnyObject]
                                        {
                                            if let longitude = location["lng"] as? Float
                                            {
                                                venueObject.longitude = longitude;
                                            }
                                            
                                            if let latitude = location["lat"] as? Float
                                            {
                                                venueObject.latitude = latitude;
                                            }
                                            
                                            if let formattedAddress = location["formattedAddress"] as? [String]
                                            {
                                                venueObject.address = formattedAddress.joinWithSeparator(" ");
                                            }
                                        }
                                        
                                        realm.add(venueObject, update: true);
                                    }
                                    
                                    do {
                                        try realm.commitWrite();
                                        print("Committing write...");
                                    }
                                    catch (let e)
                                    {
                                        print("Y U NO REALM ? \(e)");
                                    }
                            }
                            
                            NSNotificationCenter.defaultCenter().postNotificationName(API.notifications.venuesUpdated, object: nil, userInfo: nil);
                        }
                    }
            }
            
            searchTask.start()
        }
    }
}

extension CLLocation {
    
    func paramter() -> Parameters {
        let ll = "\(self.coordinate.latitude), \(self.coordinate.longitude)"
        let llAcc = "\(self.horizontalAccuracy)"
        let alt = "\(self.altitude)"
        let altAcc = "\(self.verticalAccuracy)"
        let paramters = [
            Parameter.ll:ll,
            Parameter.llAcc:llAcc,
            Parameter.alt:alt,
            Parameter.altAcc: altAcc
        
        ]
        return paramters
    }
    
}