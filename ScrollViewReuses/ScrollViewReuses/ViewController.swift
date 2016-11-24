//
//  ViewController.swift
//  ScrollViewReuses
//
//  Created by Lam Le Van on 11/24/16.
//  Copyright © 2016 Asian TechAsian Tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var scrollView: UIScrollView!
    private var width: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        for i in 0...50 {
            configLabel(i)
        }
        width = width + 100
        scrollView.contentSize = CGSize(width: width, height: scrollView.bounds.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    private func configLabel(index: Int) {
        let myLabel = MyLabel(index: index, scrollView: scrollView)
        scrollView.addSubview(myLabel)
        width = 100 * CGFloat(index)
    }
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let currentPage: Int = Int(scrollView.contentOffset.x / 100)
        print(currentPage)

        if (scrollView.viewWithTag(currentPage + 1) != nil) {
            
        } else {
            
        }
        if currentPage > 0 {
            for i in 0..<currentPage {
                if i < (currentPage - 1) || i > (currentPage + 1) && (scrollView.viewWithTag(i + 1) != nil) {
                    scrollView.viewWithTag(i + 1)?.removeFromSuperview()
                }
            }
        }

    }
}

class MyLabel: UILabel {
    
    convenience init(index: Int, scrollView: UIScrollView) {
        let frame = CGRect(x: CGFloat(index * 100), y: 0, width: 100, height: scrollView.bounds.height)
        self.init(frame: frame)
        self.text = "Title \(index)"
        self.textAlignment = .Center
    }
    
}