//
//  StatePattern.swift
//  BehaviorPattern
//
//  Created by Lam Le Van on 2/5/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import Foundation

protocol IAudioPlayerState {
    func buttonAction(player: AudioPlayer)
    func buttonSource(player: AudioPlayer)
}

class AudioPlayer {
    
    private var state: IAudioPlayerState
    init(state: IAudioPlayerState) {
        self.state = state
    }
    
    func actionButton() {
        state.buttonAction(player: self)
    }
    
    func sourceButton() {
        state.buttonSource(player: self)
    }
    
    var currentState: IAudioPlayerState {
        get {
            return state
        }
        set {
            state = newValue
        }
    }
}

class RadioState: IAudioPlayerState {

    init() {
        print("Radio Mode")
    }
    
    func buttonSource(player: AudioPlayer) {
        print("Changing to music code")
        player.currentState = MusicPlayingState()
    }
    
    func buttonAction(player: AudioPlayer) {
        print("Choosing next station and playing it")
    }

}

class MusicPlayingState: IAudioPlayerState {
    
    init() {
        print("Music play mode")
    }
    
    internal func buttonSource(player: AudioPlayer) {
        print("Changing source to standby mode")
        player.currentState = StandByState()
    }

    internal func buttonAction(player: AudioPlayer) {
        print("Changing to pausing mode")
        player.currentState = MusicPlayingState()
    }
}

class StandByState: IAudioPlayerState {
    
    init() {
        print("Standby mode")
    }
    
    func buttonAction(player: AudioPlayer) {
        print("Changing to radio mode")
        player.currentState = RadioState()
    }
    
    func buttonSource(player: AudioPlayer) {
        print("cannot launch an action in stand by mode")
    }
}

class MusicPausedState: IAudioPlayerState {
    
    init() {
        print("Music paused mode")
    }
    
    func buttonSource(player: AudioPlayer) {
        print("Changing source to Standby Mode")
        player.currentState = StandByState()
    }
    
    func buttonAction(player: AudioPlayer) {
        print("Changing to playing mode")
        player.currentState = MusicPlayingState()
    }

}
