//
//  PreditionGettor.swift
//  AlamofireDemo
//
//  Created by Lam Le Van on 11/11/16.
//  Copyright © 2016 Asian Tech. All rights reserved.
//

import Foundation
import ObjectMapper

class PreditionGettor {
    
    static let sharedInstance = PreditionGettor()
    
    func getPreditions(completion: (Predictions?)->()) {
        let path = NSBundle.mainBundle().pathForResource("Location", ofType: "json")
        if let content = try? NSString(contentsOfFile: path!, encoding: NSUTF8StringEncoding) {
            let data = content.dataUsingEncoding(NSUTF8StringEncoding)
            if let attributes = try? NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {
                let predition = Mapper<Predictions>().map(attributes)
                completion(predition)
            }
        }
    }

}