//
//  ArtWorkNetwork.swift
//  HonoluluArtDemo
//
//  Created by LeVanLam on 2/19/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ArtWorkNetwork: BasicNetwork {
    
    override var method: HTTPMethod {
        return .get
    }
    
    override var parameter: [String : Any] {
        return [:]
    }
    
    override var urlString: String {
        return API.url
    }
    
    var sendData: ((Artworks?, NSError?) -> Void)?
    
    override func connectDidFinishWith(json: JSON) {
        let artWorks = Artworks(json: json)
        sendData?(artWorks, nil)
    }
    
    override func connectDidErrorWith(json: JSON) {
        let message = json["message"].stringValue
        let error = json["error"].boolValue
        let nsError: NSError? = NSError(domain: "", code: error.intValue, userInfo: ["message": message])
        sendData?(nil, nsError)
    }
}

extension Bool {
    var intValue: Int {
        if self {
            return 1
        }
        return 0
    }
}
