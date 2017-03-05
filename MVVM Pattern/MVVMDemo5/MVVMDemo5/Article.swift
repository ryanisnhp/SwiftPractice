//
//  Article.swift
//  MVVMDemo5
//
//  Created by Le Van Lam on 3/5/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit

class Article {
    
    var title: String
    var body: String
    var date: Date
    var thumbnail: String
    var saved: Bool
    
    init(title: String, body: String, date: Date, thumbnail: String) {
        self.title = title
        self.body = body
        self.date = date
        self.thumbnail = thumbnail
        saved = true
    }
}
