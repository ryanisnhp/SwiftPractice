//
//  DateUtil.swift
//  WNCalendar1
//
//  Created by Lam Le Van on 8/30/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation

class DateUtil {
    
    class func getCurrentDate() -> String {
        let formatter = NSDateFormatter()
        let gregorianCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let locale = NSLocale(localeIdentifier: "en_US")
        formatter.locale = locale
        formatter.calendar = gregorianCalendar
        formatter.dateFormat = "dd"
        return formatter.stringFromDate(NSDate())
    }
    
    class func getCurrentMonth() -> String {
        let formatter = NSDateFormatter()
        let gregorianCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let locale = NSLocale(localeIdentifier: "en_US")
        formatter.locale = locale
        formatter.calendar = gregorianCalendar
        formatter.dateFormat = "MM"
        return formatter.stringFromDate(NSDate())
    }
    
    class func getCurrentYear() -> String {
        let formatter = NSDateFormatter()
        let gregorianCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let locale = NSLocale(localeIdentifier: "en_US")
        formatter.locale = locale
        formatter.calendar = gregorianCalendar
        formatter.dateFormat = "yyyy"
        return formatter.stringFromDate(NSDate())
    }
    
    class func getCurrentDay() -> String {
        let theDateFormatter = NSDateFormatter()
        theDateFormatter.formatterBehavior = NSDateFormatterBehavior.Behavior10_4
        let gregorianCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        theDateFormatter.calendar = gregorianCalendar
        theDateFormatter.dateFormat = "EEEE"
        let locale = NSLocale(localeIdentifier: "en_US")
        theDateFormatter.locale = locale
        let weekDay = theDateFormatter.stringFromDate(NSDate())
        return weekDay
    }
    
    class func getCurrentDateString() -> String {
        return self.getCurrentMonth() + self.getCurrentDate() + self.getCurrentYear()
    }
    
    class func getMonthString(index: Int) -> String {
        let months = [
            "January",
            "Febuary",
            "March",
            "April",
            "May",
            "June",
            "July",
            "August",
            "September",
            "October",
            "November",
            "December"
        ]
        return months[index - 1]
    }
    
    class func getDayString(index: Int) -> String {
        let daysInWeeks = [
            "Sunday",
            "Monday",
            "Tuesday",
            "Wednesday",
            "Thursday",
            "Friday",
            "Saturday"
        ]
        return daysInWeeks[index]
    }
    
    class func getDaysInMonth(month: Int, year: Int) -> Int {
        let febDays = year % 4 == 0 ? 29: 28
        let monthDays = [31, febDays, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        return monthDays[month - 1]
    }
    
    class func getDayOfDate(date: Int, month: Int, year: Int) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let gregorianCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        dateFormatter.calendar = gregorianCalendar
        let locale = NSLocale(localeIdentifier: "en_US")
        dateFormatter.locale = locale
        let capturedStartDate = dateFormatter.dateFromString("\(year)-\(month)-\(date)")
        let weekDay = NSDateFormatter()
        weekDay.locale = locale
        weekDay.dateFormat = "EEEE"
        return weekDay.stringFromDate(capturedStartDate!)
    }
}