//
//  WNCalendar.swift
//  WNCalendar1
//
//  Created by Lam Le Van on 9/2/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit

extension String {
    var intValue: Int {
        return Int(self) ?? 0
    }
}

class WNCalendar: UIView {
    
    let scrollView: LazyScrollView
    let controllers = []
    let calendars = []
    let monthLabels = []
    
    var year = 0
    var month = 0
    let prevYear = 0
    let prevMonth = 0
    let nextYear = 0
    let nextMonth = 0
    let currentDate = DateUtil.getCurrentDate().intValue
    let currentMonth = DateUtil.getCurrentMonth().intValue
    let currentYear = DateUtil.getCurrentYear().intValue
    let state = LoadStates.Start
    let scrollState = ScrollStates._120
    let previousIndex = 0
    let scrollLeft = false
    let firstDay = 0
    let daysInWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    let cellSize = CGSize.zero
    let selectedRow = -1
    let headSize = 0
    
    override init(frame: CGRect) {
    }
    
    init(frame: CGRect, month: Int, year: Int) {
        
    }
    
    init(frame: CGRect, scrollDirection: ScrollDirection, pagingEnabled: Bool) {
        
    }
    
    init(frame: CGRect, month m: Int, year y: Int, scrollDirection direction: ScrollDirection, pagingEnabled: Bool) {
        super.init(frame: frame)
        if m == 0 && y == 0 {
            month = currentMonth
            year = currentYear
        } else {
            month = m
            year = y
        }
        let rect = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        scrollView = LazyScrollView(frame: frame, direction: direction, circularScroll: false, circularScrolling: false, paging: true)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}