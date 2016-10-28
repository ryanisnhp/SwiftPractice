//: Playground - noun: a place where people can play

import Cocoa

//Interface media player

enum AudioType {
    case vlc
    case mp4
}

protocol MediaPlayer {
    func play(audioType: AudioType, fileName: String)
}

//Advance media player
protocol AdvancedMediaPlayer {
    func playVlc(fileName: String)
    func playV4(fileName: String)
}

//Create concrete 
class VlcPlayer: AdvancedMediaPlayer {
    
    func playVlc(fileName: String) {
        print("Play vlc file.name + \(fileName)")
    }
    
    func playV4(fileName: String) {
        //do nothing
    }
}

class Mp4Player: AdvancedMediaPlayer {
    
    func playVlc(fileName: String) {
        print("Play mp4 file.name + \(fileName)")
    }
    
    func playV4(fileName: String) {
        //do nothing
    }
}

class MediaAdapter: MediaPlayer {

    private var advancedMUsicPlayer: AdvancedMediaPlayer
    
    init(audioType: AudioType) {
        if  audioType == AudioType.mp4 {
            self.advancedMUsicPlayer = VlcPlayer()
        } else {
            self.advancedMUsicPlayer = Mp4Player()
        }
    }
    
    func play(audioType: AudioType, fileName: String) {
        if audioType == AudioType.mp4 {
            advancedMUsicPlayer.playV4(fileName)
        } else {
            advancedMUsicPlayer.playVlc(fileName)
        }
    }
    
}

class AudioPlayer: MediaPlayer {
    
    var mediaAdapter: MediaAdapter?
    
    func play(audioType: AudioType, fileName: String) {
        if audioType == AudioType.mp4 {
            print(fileName)
        } else {
            mediaAdapter = MediaAdapter(audioType: audioType)
            mediaAdapter!.play(audioType, fileName: fileName)
        }
    }
}

let audioPlayer = AudioPlayer()
audioPlayer.play(AudioType.mp4, fileName: "beyon the horizon")
audioPlayer.play(AudioType.mp4, fileName: "alone.mp3")
audioPlayer.play(AudioType.vlc, fileName: "fdfsdf")
audioPlayer.play(AudioType.vlc, fileName: "mfdfdf")
