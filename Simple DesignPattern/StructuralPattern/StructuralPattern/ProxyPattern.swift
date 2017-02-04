//
//  ProxyPattern.swift
//  StructuralPattern
//
//  Created by Lam Le Van on 2/4/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import Foundation

protocol IAnimation {
    func display() -> String
    func click() -> String
}

class Video: IAnimation {
    
    func click() -> String {
        return ""
    }
    
    func display() -> String {
        return "Display the video"
    }
    
    func load() -> String {
        return "Loading the video"
    }
    
    func play() -> String {
        return "Playing the video"
    }
}

class ScreenShot: IAnimation {
    
    private var video: Video?
    
    func display() -> String {
        if let video = video {
            return video.display()
        } else {
            return "Display the screen shot of the video"
        }
    }

    func click() -> String {
        if let video = video {
            return video.play()
        } else {
            video = Video()
            return video!.load()
        }
    }
}
