//
//  LazyScrollView.swift
//  WNCalendar1
//
//  Created by Lam Le Van on 8/30/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit

class LazyScrollView: UIScrollView {
    
    enum LazyScrollViewScrollDirection: Int {
        case Backward
        case Forward
    }
    
    enum LazyScrollViewDirection: Int {
        case Horizontal
        case Vertical
    }
    
    enum LazyScrollViewTransition: Int {
        case Auto = 0
        case Forward = 1
        case Backward = 2
    }
    
    static let transitionDuration = 0.4
    
    let numberOfPages: UInt = 0
    let currentPage: UInt = 0
    let isManualAnimating = false
    let circularScrollEnabled = false
    let timer_autoPlay: NSTimer?
    var direction: LazyScrollViewDirection
    var circularScroll = false
    var paging = false

    
    private var lazyFrame: CGRect
    
    init() {
        self.lazyFrame = CGRect.zero
        super.init(frame: self.lazyFrame)
    }
    
    init(frame: CGRect, direction: LazyScrollViewDirection, circularScroll: Bool, circularScrolling paging: Bool) {
        self.direction = direction
        self.circularScroll = circularScroll
        self.paging = paging
//        self.initializeControl()
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func initializeControl() {
        
    }
}
