//
//  BasicNetwork.swift
//  AlamofireDemo
//
//  Created by LeVanLam on 2/15/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import Alamofire
import SwiftyJSON

protocol BasicNetworkable {
    var urlString: String {get}
    var method: HTTPMethod {get}
    var parameter: [String: Any] {get}
}

class BasicNetwork: BasicNetworkable {
    
    required init() {
    }
    internal var method: HTTPMethod {
        fatalError("method is not overriden")
    }

    internal var parameter: [String : Any] {
        fatalError("parameter is not overriden")
    }

    var urlString: String {
        fatalError("urlString is not overriden")
    }
    
    final private var contentType: [String] {
        return ["application/json"]
    }
    
    func execute() {
        Alamofire.request(urlString, method: method, parameters: parameter, encoding: URLEncoding.httpBody).validate(statusCode: 200..<300).validate(contentType: contentType).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                print(value)
                self.connectDidFinishWith(json: JSON(value))
                break
            case .failure(let error):
                print(error)
                self.connectDidFinishWith(json: JSON(error))
                break
            }
        }
    }
    
    func connectDidFinishWith(json: JSON) {}
    func connectDidErrorWith(json: JSON) {}

}
