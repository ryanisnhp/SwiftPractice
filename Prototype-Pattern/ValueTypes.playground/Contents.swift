//: Playground - noun: a place where people can play

import UIKit

struct Appointment {
    
    var name: String
    var day: String
    var place: String
    
    init(name: String, day: String, place: String) {
        self.name = name
        self.day = day
        self.place = place
    }
    
    func printDetails(label: String) {
        print("\(label) with \(name) on \(day) at \(place)")
    }
}

var beerMeeting = Appointment(name: "Bob", day: "Mon", place: "Joe 's Bar")

var workMeeting = beerMeeting
workMeeting.name = "Alice"
workMeeting.day = "Fri"
workMeeting.place = "Conference Rm 2"

beerMeeting.printDetails("Social") // Luc nay ta su dung struct nhu la mot template de tao ra 1 object moi, dayla prototype
workMeeting.printDetails("Work") // Va ta tao ra mot new object tu prototype, day chinh la clone. Mot khi da tao ra clone, ta gan gia tri moi nhu name, day va place, cau hinh bieu dien nhu mot doi tuong khac biet

