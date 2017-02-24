//
//  VnexpressNetwork.swift
//  AlamofireWithXML
//
//  Created by Le Van Lam on 2/24/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit
import Alamofire
import SWXMLHash

struct API {
    static let urlDantri = "http://dantri.com.vn/trangchu.rss"
    static let urlVnexpress = "http://vnexpress.net/rss/tin-moi-nhat.rss"
}

class VnexpressNetwork {
    
    static var sharedInstance = VnexpressNetwork()
    
    func parseXM() {
        Alamofire.request(API.urlVnexpress, method: .get, parameters: nil, headers: nil).responseJSON { (response) in
            guard let data = response.data else { return }
            let xml = SWXMLHash.parse(data)
            let vnexpresses = Vnexresses(xml: xml)
        }
    }
}

class Vnexresses {
    
    var objects: [Vnexpress] = []
    
    init(xml: XMLIndexer) {
        let xmlIndexers = xml["rss"]["channel"]["item"].all
        for xmlIndexer in xmlIndexers {
            let vnexpress = Vnexpress(xml: xmlIndexer)
            objects.append(vnexpress)
        }
    }
}

class Vnexpress {
    
    var title: String?
    var description: String?
    var pubDate: String?
    var link: String?
    var guid: String?
    
    init(xml: XMLIndexer) {
        title = xml["title"].element?.text
        description = xml["description"].element?.text
        pubDate = xml["pubDate"].element?.text
        link = xml["link"].element?.text
        guid = xml["guid"].element?.text
    }
}
