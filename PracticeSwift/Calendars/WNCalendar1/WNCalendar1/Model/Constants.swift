//
//  Constants.swift
//  WNCalendar1
//
//  Created by Lam Le Van on 9/2/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit

struct Constants {
    static let maxMonth = 12
    static let minMonth = 1
    static let maxCell = 42
    static let deselectRow = -1
    static let daysInWeeks = 7
    static let maxWeek = 6
    static let calendarToHeaderRatio = 7
    static let headerFontRatio = 0.4
    static let cellFontRatio: CGFloat = 0.3
    static let labelToCellRatio = 0.7
    static let circleToCellRatio = 0.8
}

struct Colors {
    static let viewBackgroundColor = UIColor.blackColor()
    static let scrollViewBackgroundColor = UIColor.whiteColor()
    static let calendarBackgroundColor = UIColor.whiteColor()
    static let headerTextColor = UIColor.redColor()
}

struct Cell {
    static func systemFontOfSize(fontSize: CGFloat) -> UIFont {
        return UIFont.systemFontOfSize(fontSize * Constants.cellFontRatio)
    }
    static func boldSystemFontOfSize(fontSize: CGFloat) -> UIFont {
        return UIFont.boldSystemFontOfSize(fontSize * Constants.cellFontRatio)
    }
    static let cellBackgroundColor = UIColor.whiteColor()
    static let cellTopLineColor = UIColor.lightGrayColor()
    static let dateTextColor = UIColor.blackColor()
    
    //Current date's cell
    static let currentDateCircleColor = UIColor.redColor()
    static let currentDateTextColor = UIColor.whiteColor()
    
    //Selected date's cell
    static let selectedDateCircleColor = UIColor.blackColor()
    static let selectedDateTextColor = UIColor.whiteColor()
}

enum LoadStates: Int {
    case Start = -1
    case Previous = 0
    case Next
    case Current
}

enum ScrollStates: Int {
    case _120
    case _201
    case _012
}

