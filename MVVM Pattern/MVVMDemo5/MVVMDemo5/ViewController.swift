//
//  ViewController.swift
//  MVVMDemo5
//
//  Created by Le Van Lam on 3/5/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    
    var articleViewModel: ArticleViewModel! {
        didSet {
            textView.text = articleViewModel.body
            dateLabel.text = articleViewModel.date
            titleLabel.text = articleViewModel.title
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
    
    private func setupData() {
        let article = Article(title: "title", body: "My Name Lam", date: Date(), thumbnail: "https://google.com.vn")
        articleViewModel = ArticleViewModel(article: article)
    }
}
