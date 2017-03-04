//
//  ProfileViewModel.swift
//  MVVMDemo3
//
//  Created by LeVanLam on 2/18/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import Foundation

enum ProfileSection: Int {
    
    case time
    case warmUp
    case coolDown
    
    static var count = ProfileSection.coolDown.hashValue + 1
    
    static let sectionTitles: [ProfileSection: String] = [
        time: "Time",
        warmUp: "Warm Up",
        coolDown: "Cool Down"
    ]
    
    var sectionTitle: String {
        return ProfileSection.sectionTitles[self] ?? ""
    }
}

class ProfileViewModel {
    
    let profile: Profile
    
    init(profile: Profile) {
        self.profile = profile
    }
    
    func timeForProfile() -> String {
        return stringFromTimeInterval(profile.duration)
    }
    
    var sectionNumbers: Int {
        return ProfileSection.count
    }
    
    func numberOfRow(in section: Int) -> Int {
        guard let section = ProfileSection(rawValue: section) else {
            return 1
        }
        switch section {
        default: return 1
        }
    }
    
    func titleForHeader(in section: Int) -> String {
        guard let section = ProfileSection(rawValue: section) else { return "" }
        return section.sectionTitle
    }
    
    private func stringFromTimeInterval(_ timeInterval: Double) -> String {
        let timeInterval = Int(timeInterval)
        
        let hours = timeInterval / 3600
        let seconds = timeInterval % 60
        let minutes = (timeInterval / 60) % 60
        
        if hours > 0 {
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        }
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
