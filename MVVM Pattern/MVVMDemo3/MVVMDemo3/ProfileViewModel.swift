//
//  ProfileViewModel.swift
//  MVVMDemo3
//
//  Created by LeVanLam on 2/18/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import Foundation

class ProfileViewModel {
    
    let profile: Profile
    
    init(profile: Profile) {
        self.profile = profile
    }
    
    func timeForProfile() -> String {
        return stringFromTimeInterval(profile.duration)
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
