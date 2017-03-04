//
//  Profile.swift
//  MVVMDemo3
//
//  Created by LeVanLam on 2/18/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import Foundation

enum SegmentType {
    case main
    case warmUp
    case coolDown
}

enum SoundType {
    case `repeat`
    case begin
    case end
}

class Profile {
    var name = "Profile"
    var segments: [Segment] = []
    var duration: TimeInterval = 450.0
    
    init() {
        let segment = Segment(type: .main)
        self.segments.append(segment)
    }
}

class Segment {
    var enabled: Bool
    var type: SegmentType
    var sounds: [Sound] = []
    
    init(type: SegmentType) {
        self.type = type
        self.enabled = true
    }
    
    func soundOfType(type: SoundType) -> Sound? {
        
        for sound in sounds {
            if sound.type == type {
                return sound
            }
        }
        return nil
    }
}

class Sound {
    
    var enabled: Bool
    var type: SoundType
    var name = ""
    var iterations = 0
    var timeInterval: Double = 300.0
    
    init(type: SoundType) {
        self.type = type
        self.enabled = true
    }
}
