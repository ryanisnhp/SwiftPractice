//
//  Extensions.swift
//  Calendar1
//
//  Created by Lam Le Van on 2/12/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//
import UIKit

extension Date {
    
    var daysInMonth: Int {
        let calendar = NSCalendar.current
        let rng = calendar.range(of: .day, in: .month, for: self)
        return rng?.count ?? 0
    }
    
    func toString(dateFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.string(from: self)
    }
}

enum DateFormat {
    case type1
    
    var value: String {
        if self == .type1 {
            return "yyyy-MM-dd"
        }
        return ""
    }
}
