//: Playground - noun: a place where people can play

import Foundation

var builder = NSDateComponents()
builder.hour = 10
builder.day = 6
builder.month = 9
builder.year = 1940
builder.calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)
var date = builder.date
print(date)
