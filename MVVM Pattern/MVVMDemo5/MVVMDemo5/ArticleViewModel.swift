//
//  ArticleViewModel.swift
//  MVVMDemo5
//
//  Created by Le Van Lam on 3/5/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import Foundation

class ArticleViewModel {
    
    var article: Article
    var title: String {
        return article.title
    }
    
    var date: String {
        return article.date.toString
    }
    
    var body: String {
        return article.body
    }
    
    init(article: Article) {
        self.article = article
    }
}

extension Date {
    var toString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}
